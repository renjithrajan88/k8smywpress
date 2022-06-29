kubectl delete namespace ns-wpress
kubectl delete secret sec-tls -n istio-system
helm delete k8swpress
rm -r /mnt/nfs_wpress/*
