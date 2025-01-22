# Use the official PostgreSQL image from the Docker Hub
FROM postgres:latest

# Set environment variables for PostgreSQL from .env file
ENV POSTGRES_DB=${POSTGRES_DB}
ENV POSTGRES_USER=${POSTGRES_USER}
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}

# Expose the PostgreSQL port
EXPOSE 5432

# Add any custom initialization scripts to the Docker image
# COPY init.sql /docker-entrypoint-initdb.d/

# The default command will run the PostgreSQL server
CMD ["postgres"]

# Copy the .env file into the Docker image
COPY .env /docker-entrypoint-initdb.d/