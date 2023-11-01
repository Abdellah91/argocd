resource "helm_release" "argocd" {
  name = "argocd"

  repository          = "https://argoproj.github.io/argo-helm"
  chart               = "argo-cd"
  namespace           = "argocd"
  create_namespace    = true
  version             = "3.35.4"
  values              = [file("values/image-updater.yaml")]

}

resource "helm_release" "updater" {
  name = "updater"

  repository          = "https://argoproj.github.io/argo-helm"
  chart               = "argocd-image-updater"
  namespace           = "argocd"
  create_namespace    = true
  version             = "0.8.4"
  values              = [file("values/image-updater.yaml")]

}
