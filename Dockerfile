# Use the official Google Cloud SDK image as a base.
# It includes gcloud, bash, and other necessary tools.
FROM google/cloud-sdk:latest

# Copy your script into the container's filesystem.
COPY prune-images.sh /app/prune-images.sh

# Set the entrypoint for the container. This command will run when
# the Cloud Run job starts.
ENTRYPOINT ["/app/prune-images.sh"]
