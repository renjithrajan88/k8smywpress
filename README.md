# What this project is about?
Implementing a challenge to deploy WordPress in Kubernetes using various tools like istio, jenkins, terraform, etc.

# What is the requirement of this challenge?
- Deploy WordPress in Kubernetes
- Expose the WordPress using istio
- Terraform to be used for K8s cluster
- Save the terraform state file
- Use github for versioning the project files
- Serve request only if the app is ready
- Using Jenkins for CI/CD of new image

# What are the resources used in this project?
- Terraform - Infrastructure as a code service tool
- Kubernetes - Container orchasterization tool
- Istio - Service mesh tool along with ingress gateway
- Helm - Kubernetes package manager
- Digital Ocean - Cloud service provider

# What are the key features of this project?
- Deployment of kubernetes cluster and istio uisng terraform
- Availability of terraform state file in a remote location
- Persistent volumes carved from NFS server (block storage in the back end) for mysql and wordpress
- Entire deployment of wordpress, mysql and other supporting components using helm
- Readiness probe to restrict requests if the wordpress pod is not ready
- HTTPS support using self signed SSL certificates.

# What is the process followed?
1. Enabled a subscription in DigitalOcean cloud provider
2. Deployed an Ubuntu management server with connectivity to a block storage volume from digitalocean
3. Configured NFS service with two shares for wordpress and mysql
4. Installed terraform, kubectl and helm in the management server
5. Terraform configuration :
- Kubernetes cluster is deployed in digitalocean with a name "k8scluster"
- Deploys istio service mesh into the kubernetes cluster with istiod, istiocore and istioingress components
- Terraform state file is saved remotely into digitalocean space component
6. Helm configuration :
- All the kubernetes deployment files are configured as templates
- Cluster information is fed using values.yaml and _helpers.tpl
- Build a helm release named "k8swpress"

# What is in pipeline?
- Implementation of CI/CD feature using Jenkins

# Links :
- Website Link : www.k8smywpress.tk/
- Terraform State File Link (Requires authentication) : https://k8scluster.fra1.digitaloceanspaces.com/TF/terraform.tfstate 

