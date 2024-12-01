#!/bin/bash

read -p "Enter source: " source
eval $source

# Prompt for the pod search string
read -p "Enter POD_SEARCH: " POD_SEARCH

# Prompt for the values to search for in logs (comma-separated)
read -p "Enter GREP_VALUES (comma-separated): " GREP_VALUES

# Check if the pod search string or grep values are empty
if [ -z "$POD_SEARCH" ]; then
  echo "You must provide a pod search string."
  exit 1
fi

if [ -z "$GREP_VALUES" ]; then
  echo "You must provide values to search for in the logs."
  exit 1
fi

# Convert GREP_VALUES to a regular expression (OR-separated values)
GREP_REGEX=$(echo "$GREP_VALUES" | sed 's/,/\|/g')

# Find the pod name(s) matching the search string
POD_NAME=$(kubectl get pods --no-headers -o custom-columns=":metadata.name" | grep "$POD_SEARCH")

# Check if any pods were found
if [ -z "$POD_NAME" ]; then
  echo "No pods found matching: $POD_SEARCH"
  exit 1
fi

echo "Found pod(s):"
echo "$POD_NAME"

# Loop through each found pod and fetch its logs, filtering for the user-provided values
for pod in $POD_NAME; do
  echo "Checking logs for pod: $pod"
  kubectl logs "$pod" | grep --color -i -E "$GREP_REGEX"

  # Save logs to /tmp/$pod.log
  if kubectl logs "$pod" > /tmp/"$pod".log; then
    echo "Logs for pod '$pod' have been saved to '/tmp/${pod}.log'."
  else
    echo "Failed to retrieve logs for pod '$pod'."
  fi
done
