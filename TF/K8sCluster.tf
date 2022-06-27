resource "digitalocean_kubernetes_cluster" "k8scluster" {
  name   = "k8scluster"
  region = "blr1"
  version = "1.22.8-do.1"

  node_pool {
    name       = "k8scluster-pool"
    size       = "s-4vcpu-8gb"
    node_count = 2


  }
}

resource "kubernetes_namespace" "istio_system" {
  metadata {
    name = "istio-system"
  }
}
