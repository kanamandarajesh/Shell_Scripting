#!/bin/bash

read -p "enter source: " source
read -p "Enter POD_NAME patterns (e.g., astra,remit): " pod_name

eval $source

# Check if pod patterns are provided
if [ -z "$pod_name" ]; then
  echo "Pod patterns cannot be empty."
  exit 1
fi

# Convert comma-separated patterns to an array
IFS=',' read -r -a patterns <<< "$pod_name"

# Iterate over each pattern
for pattern in "${patterns[@]}"; do
  echo "Finding pods matching pattern: $pattern"

  # Find pods matching the current pattern
  pods=$(kubectl get pods --no-headers | grep -E "$pattern" | awk '{print $1}')

  # Check if any pods were found
  if [ -z "$pods" ]; then
    echo "No pods found matching the pattern '$pattern'."
    continue
  fi

  # Retrieve logs for each matching pod
  for pod in $pods; do
    echo "Retrieving logs for pod: $pod"
    if kubectl logs "$pod" > /tmp/"$pod".log; then
      echo "Logs for pod '$pod' have been saved to '/tmp/${pod}.log'."
    else
      echo "Failed to retrieve logs for pod '$pod'."
    fi
  done
done
