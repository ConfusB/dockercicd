# Start from a base image that has Python installed
FROM python:3.8 as build

# Create a working directory for the application
WORKDIR /app

# Copy the Python script and the requirements file into the working directory
COPY ./script/hello.py . 
COPY ./script/requirements.txt .
COPY version.txt .

# Install any necessary dependencies for the script
RUN pip install -r requirements.txt

# Create a second stage for the final image, starting from a lightweight base image
FROM python:3.8-slim

# Copy the application code and dependencies from the build stage
COPY --from=build /app /app

# Set the working directory to the app directory
WORKDIR /app

# Set the entrypoint for the container to the Python script
ENTRYPOINT ["python", "hello.py"]