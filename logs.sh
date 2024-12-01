#!/bin/bash
#set -x

read -p "Enter environment (UAT or PROD): " ENV
read -p "Enter country (KE or TZ or UG): " COUNTRY
read -p "Enter POD_NAME name: " pod_name

# Determine the source based on the provided environment and country
if [ "$COUNTRY" == "KE" ] && [ "$ENV" == "UAT" ]; then
    SOURCE="source ke-msb-uat"
elif [ "$COUNTRY" == "TZ" ] && [ "$ENV" == "UAT" ]; then
    SOURCE="source tz-msb-uat"
elif [ "$COUNTRY" == "UG" ] && [ "$ENV" == "UAT" ]; then
    SOURCE="source ug-msb-uat"
else
    echo "Invalid environment or country."
    exit 1
fi
# Determine the source based on the provided environment and country
if [ "$COUNTRY" == "KE" ] && [ "$ENV" == "PROD" ]; then
    SOURCE="source ke-msb-prod"
elif [ "$COUNTRY" == "TZ" ] && [ "$ENV" == "PROD" ]; then
    SOURCE="source tz-msb-prod"
elif [ "$COUNTRY" == "UG" ] && [ "$ENV" == "PROD" ]; then
    SOURCE="source ug-msb-prod"
else
    echo "Invalid environment or country."
    exit 1
fi

# Source the environment variables or configurations
eval $SOURCE

# Prompt for the pod name or pattern
#read -p "Enter the pod name or pattern: " pod_name

# Check if a pod name is provided
if [ -z "$pod_name" ]; then
  echo "Pod name cannot be empty."
  exit 1
fi

# Find pods matching the pattern
pods=$(kubectl get pods --no-headers | grep -E "$pod_name" | awk '{print $1}')

# Check if any pods were found
if [ -z "$pods" ]; then
  echo "No pods found matching the pattern '$pod_name'."
  exit 1
fi

# Retrieve logs for each matching pod
for pod in $pods; do
  echo "Retrieving logs for pod: $pod"
  if kubectl logs "$pod" > /tmp/"$pod".log; then
    echo "Logs for pod '$pod' have been saved to '/tmp/${pod}.log'."
  else
    echo "Failed to retrieve logs for pod '$pod'."
  fi
