#!/bin/bash
#set -x

# Prompt for user inputs
read -p "Enter environment (UAT or PROD): " ENV
read -p "Enter country (KE or TZ or UG): " COUNTRY
read -p "Enter POD_NAME patterns (e.g., astra,remit): " pod_name

# Determine the source based on the provided environment and country
if [ "$COUNTRY" == "KE" ] && [ "$ENV" == "UAT" ]; then
    SOURCE="source ke-msb-uat"
elif [ "$COUNTRY" == "TZ" ] && [ "$ENV" == "UAT" ]; then
    SOURCE="source tz-msb-uat"
elif [ "$COUNTRY" == "UG" ] && [ "$ENV" == "UAT" ]; then
    SOURCE="source ug-msb-uat"
elif [ "$COUNTRY" == "KE" ] && [ "$ENV" == "PROD" ]; then
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
