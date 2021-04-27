## Lỗi không curl trong pod ra ngoài được

Cách giải quyết: Restart lại coredns

```
kubectl -n kube-system rollout restart deployment coredns
```

## Lỗi không gọi vào được

Restart lại kuberlet + docker

```
systemctl restart kubelet
systemctl enable kubelet
systemctl start kubelet
systemctl restart kubelet
systemctl restart docker
```

## Lỗi forbiden khi cấu hình Jenkins

```
kubectl create clusterrolebinding permissive-binding --clusterrole=cluster-admin --user=admin --user=kubelet --group=system:serviceaccounts
```

## Lỗi không xóa được pvc, pv

```
kubectl patch pvc PVC_NAME -p '{"metadata":{"finalizers": []}}' --type=merge
```
