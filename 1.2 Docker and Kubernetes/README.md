## Helpful commands

### For local env
- Build the docker image `docker build -t ashraftheminhaj/hello-node:v1 ./app`
- Run image locally `docker run -it -p 3000:3000 ashraftheminhaj/hello-node:v1`
- push to registry `docker push ashraftheminhaj/hello-node:v1`

previous dockerfile - 1.09GB, using slim 219mb

### create a local cluster
- create the local cluster with 1 master and 1 worker node `kind create cluster --config ./local-kind/kind-config.yaml --name my-cluster`
- send the image to the cluster - `kind load docker-image ashraftheminhaj/hello-node:v2 --name my-cluster`
- port forward `kubectl port-forward service/hello-node-service 32123:3000`

### deploy using helm
- package `helm package hello-node`
- install the package (deploying application) - `helm install hello-node ./hello-node`
- now port foward to access the app - `kubectl port-forward service/hello-node-service 32123:3000`