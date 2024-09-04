# Use the official Ubuntu image as a base
FROM ubuntu:latest

# Install necessary packages including Node.js and npm
RUN apt-get update && apt-get install -y \
    git \
    wget \
    build-essential \
    libuv1-dev \
    libssl-dev \
    libhwloc-dev \
    curl

# Install Node.js (You can specify a version if needed)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Clone the specified GitHub repository
RUN git clone https://github.com/WackyDawg/automatic-dollop.git

# Change directory to the cloned repository
WORKDIR /automatic-dollop

# Install npm dependencies
RUN npm install

# Expose the port the server will run on
EXPOSE 3000

# Run the server
CMD ["node", "server.js"]
