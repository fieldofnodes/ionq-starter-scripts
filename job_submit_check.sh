#!/bin/bash

# Set your API key and endpoint
API_KEY=$(cat api-key.txt)
API_BASE_URL="https://api.ionq.co"

API_JOBS_SUBMIT_STATUS=$API_BASE_URL"/v0.3/jobs"

# Job input file
JOB_FILE=$1


# Function to submit a job and get job ID
submit_job() {
    local response=$(curl -s -X POST -H "Authorization: apiKey $API_KEY" -H "Content-Type: application/json" -d @"$JOB_FILE" "$API_JOBS_SUBMIT_STATUS")
    local job_id=$(echo "$response" | jq -r '.id')
    echo "$job_id"
}

# Function to get job status
get_job_status() {
    local job_id="$1"
    local status_response=$(curl -s "$API_JOBS_SUBMIT_STATUS/$job_id" -H "Authorization: apiKey $API_KEY")
    echo "$status_response"
}



# Function to get results URL from job status response
get_results_url() {
    local status_response="$1"
    local results_url=$(echo "$status_response" | jq -r '.results_url')
    echo "$results_url"
}

# Function to get job results
get_job_results() {
    local results_url="$1"
    local results_response=$(curl -s $API_BASE_URL$results_url -H "Authorization: apiKey $API_KEY")
    echo "$results_response"
}

# Main script
echo ""
echo "Submitting job for $JOB_FILE"
echo ""
# Submit job and get job ID
job_id=$(submit_job)
echo "Job submitted with ID: $job_id"
echo ""
echo "Sleep 5 seconds to allow job to start"
sleep 5

# Get job status
job_status=$(get_job_status "$job_id")


# Get results URL from job status
results_url=$(get_results_url "$job_status")
echo ""
echo "Getting results"
echo ""
job_results=$(get_job_results "$results_url")
echo "Job results: $job_results"
echo ""
