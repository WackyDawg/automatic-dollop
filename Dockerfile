# Use the official Ubuntu image as the base
FROM ubuntu:latest

# Install necessary packages and dependencies
RUN apt-get update && \
    apt-get install -y \
    wget \
    gnupg \
    curl \
    ca-certificates \
    fonts-liberation \
    libappindicator3-1 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libxss1 \
    libxtst6 \
    libnss3 \
    libgbm1 \
    libu2f-udev \
    libgdk-pixbuf2.0-0 \
    libpango-1.0-0 \
    libgtk-3-0 \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Install Node.js (Puppeteer requires Node.js)
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs

# Install Puppeteer
RUN npm install puppeteer express

# Create a directory for your app
WORKDIR /usr/src/app

# Copy your app's source code into the container
COPY . .

# Command to run your app (adjust as needed)
CMD ["node", "server.js"]
