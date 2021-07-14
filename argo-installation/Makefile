install:
	-echo "Make sure you are connected to the correct cluster"
	-/usr/local/bin/kubectl create namespace argocd
	-/usr/local/bin/kubectl get namespaces
	-/usr/local/bin/kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml\n
	-/usr/local/bin/kubectl -n argocd port-forward services/argocd-server 8080:80 &
	-/usr/local/bin/kubectl get all -n argocd
	-echo "Argo cluster is available at localhost:8080"
	-echo "The username is admin and the password is encoded in base64 "
	-/usr/local/bin/kubectl get secrets/argocd-initial-admin-secret -o yaml  -n argocd

clean:
	-echo "Deleting Argo namespace"
	-/usr/local/bin/kubectl delete namespace argocd
	-echo "Sleeping for 10 seconds"
	-sleep 10
	-/usr/local/bin/kubectl get namespaces

test:
	-echo "Test"