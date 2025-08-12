# Define variables for your repository and image
PROJECT_ID="your-project-id"
REGION="us-central1"
REPOSITORY="cloud-run-source-deploy" # Default repo for 2nd gen functions
IMAGE_NAME="my-function"

# List all images for the function, sorted by date, and identify all but the most recent one for deletion.
gcloud artifacts docker images list "${REGION}-docker.pkg.dev/${PROJECT_ID}/${REPOSITORY}/${IMAGE_NAME}" \
  --sort-by="~CREATE_TIME" \
  --limit=unlimited \
  --filter="tags:*" \
  --format="get(version)" \
  | tail -n +2 \
  | xargs -I {} gcloud artifacts docker images delete "${REGION}-docker.pkg.dev/${PROJECT_ID}/${REPOSITORY}/${IMAGE_NAME}:{}" --delete-tags --quiet
