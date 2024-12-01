#!/bin/bash

# Prompt for pod name and reference
echo -n "Enter pod Name: "
read pod
echo -n "Enter reference: "
read reference

# Iterate over the pods (even though we're handling one, we'll use the loop as requested)
for pods in $pod; do
    echo "Checking pod: $pods"
    
    # List the pods and search for the pod name
    kubectl get pods | grep "$pods"
    
    # Check logs for the reference in the specified pod
    echo "Searching logs for reference: $reference"
    kubectl logs "$pods" | grep --color=auto "$reference"
    kubectl logs "$pods" > /tmp/$pods.log
done
