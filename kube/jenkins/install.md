# install

## First, use kubectl to create the Jenkins namespace:

$ kubectl create namespace jenkins

## Create this deployment in the jenkins namespace:

$ kubectl apply -f . --namespace jenkins

$ kubectl get pods -n jenkins

## Create the Service in the same namespace:

$ kubectl create -f jenkins-service.yaml --namespace jenkins
$ kubectl get services --namespace jenkins

$ kubectl logs jenkins-6fb994cfc5-twnvn -n jenkins

Admin password
