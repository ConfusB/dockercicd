# Start from a base image that has Python installed
FROM python:3.8 as build

# Create a working directory for the application
WORKDIR /app

# Copy the Python script and the requirements file into the working directory
COPY ./scripts/hello.py . 
COPY ./scripts/requirements.txt .
COPY version.txt .

# Create a second stage for the final image, starting from a lightweight base image
FROM python:alpine3.8

# Copy the application code and dependencies from the build stage
COPY --from=build /app /app

# Set the working directory to the app directory
WORKDIR /app

RUN pip install -r requirements.txt

# Set the entrypoint for the container to the Python script
EXPOSE 8081
ENTRYPOINT ["python", "hello.py"]