# Use the official Ubuntu image as a base
FROM ubuntu:latest

# Install necessary packages and dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    libuv1-dev \
    libssl-dev \
    libnss3 \
    libssl-dev \
    neofetch

# Install Node.js from NodeSource
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Clone the specified GitHub repository
RUN git clone https://github.com/WackyDawg/ubiquitous-octo-robot.git

# Change directory to the cloned repository
WORKDIR /ubiquitous-octo-robot

# Install Node.js dependencies
RUN npm install

# Copy the server.js file into the container (if not already included in the cloned repo)
# COPY server.js .

# Expose the port the server will run on
EXPOSE 9806

# Run the Express server
CMD ["node", "server.js"]
