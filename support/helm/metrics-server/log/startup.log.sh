NAME: metrics
LAST DEPLOYED: Wed Oct  6 15:15:12 2021
NAMESPACE: kube-system

STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
** Please be patient while the chart is being deployed **

The metric server has been deployed.

In a few minutes you should be able to list metrics using the following
command:

  kubectl get --raw "/apis/metrics.k8s.io/v1beta1/nodes"
