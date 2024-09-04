# Use the official Ubuntu image as a base
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    git \
    wget \
    build-essential \
    libuv1-dev \
    libssl-dev \
    libhwloc-dev \
    neofetch 

# Set the command to run neofetch when the container starts
CMD ["neofetch"]    

# Clone the specified GitHub repository
RUN git clone https://github.com/WackyDawg/ubiquitous-octo-robot.git

# Change directory to the cloned repository
WORKDIR /ubiquitous-octo-robot

# Install Node.js and Express
RUN npm install express

# Copy the server.js file into the container
COPY server.js .

# Expose the port the server will run on
EXPOSE 9806

# Run the Express server
CMD ["node", "server.js"]
