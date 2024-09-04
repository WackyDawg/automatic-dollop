# Use the official Ubuntu image as a base
FROM ubuntu:latest

# Update the package list and install neofetch
RUN apt-get update && apt-get install -y neofetch

# Set the command to run neofetch when the container starts
CMD ["neofetch"]
