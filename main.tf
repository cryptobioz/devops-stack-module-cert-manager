locals {
  autosync = var.app_autosync ? { "allow_empty" = false, "prune" = true, "self_heal" = true } : {}
}

resource "null_resource" "dependencies" {
  triggers = var.dependency_ids
}

resource "argocd_project" "this" {
  metadata {
    name      = "cert-manager"
    namespace = var.argocd_namespace
    annotations = {
      "devops-stack.io/argocd_namespace" = var.argocd_namespace
    }
  }

  spec {
    description  = "cert-manager application project"
    source_repos = ["https://github.com/camptocamp/devops-stack-module-cert-manager.git"]

    destination {
      name      = "in-cluster"
      namespace = var.namespace
    }

    destination {
      name      = "in-cluster"
      namespace = "kube-system"
    }

    orphaned_resources {
      warn = true
    }

    cluster_resource_whitelist {
      group = "*"
      kind  = "*"
    }
  }
}

data "utils_deep_merge_yaml" "values" {
  input = [for i in var.helm_values : yamlencode(i)]
}

resource "argocd_application" "this" {
  metadata {
    name      = "cert-manager"
    namespace = var.argocd_namespace
  }

  wait = true

  spec {
    project = argocd_project.this.metadata.0.name

    source {
      repo_url        = "https://github.com/camptocamp/devops-stack-module-cert-manager.git"
      path            = "charts/cert-manager"
      target_revision = "main"
      helm {
        values = data.utils_deep_merge_yaml.values.output
      }
    }

    destination {
      name      = "in-cluster"
      namespace = var.namespace
    }

    ignore_difference {
      group         = "admissionregistration.k8s.io"
      kind          = "ValidatingWebhookConfiguration"
      name          = "cert-manager-webhook"
      json_pointers = ["/webhooks/0/namespaceSelector/matchExpressions/2"]
    }

    sync_policy {
      automated = local.autosync

      retry {
        limit = "5"
        backoff = {
          duration     = "30s"
          max_duration = "2m"
          factor       = "2"
        }
      }

      sync_options = [
        "CreateNamespace=true"
      ]
    }
  }

  depends_on = [
    resource.null_resource.dependencies,
  ]
}

resource "null_resource" "this" {
  depends_on = [
    resource.argocd_application.this,
  ]
}
