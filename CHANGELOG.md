# Changelog

## 1.0.0-alpha.1 (2022-11-18)


### ⚠ BREAKING CHANGES

* move Terraform module at repository root
* rename helm_values_overrides as helm_values
* pass hcl values and rename to helm_values_overrides
* use var.cluster_info

### Features

* add k3s profile ([1e498d9](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/1e498d993f057148d3b5d3a015704458996f73c9))
* add role assignment DNS zone contributor ([d9fa4ce](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/d9fa4ce77fbe29070490180556fde6bb1f6d2dd1))
* add service monitor to solve monitoring module dependency ([b55797c](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/b55797c192c395d376aa790a77cb506635b5b17b))
* add sks support ([eb70e89](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/eb70e89ca09a0ab479e6cee8f2111302c79aceea))
* add support of scaleway ([#16](https://github.com/camptocamp/devops-stack-module-cert-manager/issues/16)) ([2c82a46](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/2c82a46676cb3ffe7945dee7f64e1c1948f3f7d4))
* **aks:** add aks support ([eaefcd0](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/eaefcd07ebb5f59b5235ce930e22d8fa7957f232))
* **eks:** allow multiple domains ([#14](https://github.com/camptocamp/devops-stack-module-cert-manager/issues/14)) ([4e0a4fe](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/4e0a4fe23518f3f5a918f5bc5551ed4cd09af802))
* pass hcl values and rename to helm_values_overrides ([d2334a9](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/d2334a93d53ec10264a6f22409d73cb8914b1848))
* rename helm_values_overrides as helm_values ([1f027eb](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/1f027eb43521c5c24f196a857efbecd8dfbe3ea6))


### Bug Fixes

* **aks:** add missing resource_group_name variable ([a84ded5](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/a84ded57b64d87d84bf16a4f16d85aa6fa9a03ed))
* **aks:** sym link to version.tf so providers get declared ([0669ef9](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/0669ef9e3f97a502dc60366c92e207ecf5c1ad7a))
* allow kube-system in project ([a723ffe](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/a723ffe4784d340b24c3a977642a0e4feeeddbb2))
* argocd_namespace ([7d4ba0e](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/7d4ba0e6f106e14ce20b8050606242c5826fa567))
* **azure:** field name azuredns becomes azureDNS in ClusterIssuer CRD ([d71c0c2](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/d71c0c2c3c28d517e86357eb1a4a47fc0b2f64cb))
* contains(profiles, "eks") ([03866a8](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/03866a81d6955dbc36ebe6415229682cd9305aa6))
* default namespace is cert-manager ([f472ad7](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/f472ad7fc6ab8177f4819ec69814fa7f27c05964))
* do not delay Helm values evaluation ([e335f07](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/e335f0730c304472e08eb34faca4f8b6da12fa80))
* **eks:** rename values.yaml to value.tmpl.yaml ([1be158d](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/1be158d93fda5680214de5658884d76391967f61))
* **helm:** use non-deprecated CRD version for cluster issuers ([0f31a9b](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/0f31a9bdeefcbc397fdb7fbbe4c1b3d2c25cca33))
* ignore validating webhook changes ([19b8ab5](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/19b8ab58e265df3342b2e103cfe4d25b6f24bf1f))
* json_pointers parameter name ([7d8630f](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/7d8630f632971f8f6cdbaed7e6aebceb857c07c0))
* name of the ignored field ([bd5af14](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/bd5af14e5c5b1bac7532c35a8649459a61277b37))
* pass cluster_oid_issuer_url in var.cert-manager ([13276a9](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/13276a9ed524234807d0a97a602ecd9977944ca2))
* pass variables to eks module ([923fa31](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/923fa31c9c65455ff02b0dc1e95e619d2d22543e))
* README ([2f07d30](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/2f07d30e2d61702cd7bb74f86423c07775a27e30))
* remove cluster_id var from eks module ([fa7c785](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/fa7c785195498c325faa3a839005b1b90a08069a))
* remove legacy cert-manager variable in template ([979cf96](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/979cf9667f280757dd31b4afba66938c3d9a261f))
* remove profiles from aks and eks submodules ([64ee182](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/64ee18286c5137c6bdc53ba619450cf09f6d0b4a))
* remove read only attribut ([#17](https://github.com/camptocamp/devops-stack-module-cert-manager/issues/17)) ([52742d4](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/52742d436868f320b695c53e35a4c55631290281))
* retry policy ([fa70404](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/fa70404b45ffa746128e8f31f87efa4e39bad9a4))
* rework eks module ([e8ceb3d](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/e8ceb3d39023f60a5f8b7262e080f1b4edf0cc43))
* **self-signed:** typo in helm parameter tlsCrt ([68e8cad](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/68e8cad3df8aa83e4008df58e986ab8a7d26c1a5))
* **self-signed:** use private key instead of certificate for tlsKey ([a376d88](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/a376d88fb31a1f23fa61ea7a30d7858ed3b7e92e))
* **sks:** helm_values syntax issue ([#15](https://github.com/camptocamp/devops-stack-module-cert-manager/issues/15)) ([b1ef19a](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/b1ef19a35057afb29e857c1fb86dda041240f443))
* sync policy ([c3a9e92](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/c3a9e9252f171d4041105fb730e7b172414a2694))
* use underscore ([48e20ba](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/48e20bae032d85e33637ab55a86cdf226824f49f))
* wait for app removel before deleting the project ([6479e86](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/6479e863b61d3b615a143315d0b3917bc03a2525))
* work around argocd terraform provider default values ([829b85c](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/829b85c45da46035cfdd70836ee6082b65542587))


### Code Refactoring

* move Terraform module at repository root ([2a1805b](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/2a1805b076fe0e1f9764cfc65b5b493dd4af32a6))
* use var.cluster_info ([9d1cc27](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/9d1cc276b9d92ace11939a8ba2a620d7263ca985))


### Continuous Integration

* add central workflows including release-please ([#20](https://github.com/camptocamp/devops-stack-module-cert-manager/issues/20)) ([e7fc334](https://github.com/camptocamp/devops-stack-module-cert-manager/commit/e7fc334afcd3ddabba4bc07a93257c39fa3f1ce0))
