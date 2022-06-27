terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}



provider "digitalocean" {
  token = nonsensitive(var.API_key)

}
provider "helm" {
  kubernetes {
    host = digitalocean_kubernetes_cluster.k8scluster.endpoint
    token = digitalocean_kubernetes_cluster.k8scluster.kube_config[0].token
    cluster_ca_certificate = base64decode(digitalocean_kubernetes_cluster.k8scluster.kube_config[0].cluster_ca_certificate)
  }
}
provider "kubernetes" {
    host = digitalocean_kubernetes_cluster.k8scluster.endpoint
    token = digitalocean_kubernetes_cluster.k8scluster.kube_config[0].token
    cluster_ca_certificate = base64decode(digitalocean_kubernetes_cluster.k8scluster.kube_config[0].cluster_ca_certificate)
}


