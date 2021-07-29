#Make sure this is enabled

sudo sysctl net.bridge.bridge-nf-call-iptables=1



# Create NS
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/master/manifests/namespace.yaml
# create memerlist secrets
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
#apply metalbl manifest
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/master/manifests/metallb.yaml

# apply cm
kubectl apply -f metallb/metal-cm.yml
