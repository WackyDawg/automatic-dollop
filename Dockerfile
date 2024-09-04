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
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libxi6 \
    libxtst6 \
    libxss1 \
    libgtk-3-0 \
    libgdk-pixbuf2.0-0 \
    libgbm-dev \
    fonts-liberation \
    libappindicator3-1 \
    libnspr4 \
    libu2f-udev \
    lsb-release \
    neofetch

# Run neofetch to display system information
RUN neofetch

# Install Node.js from NodeSource
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Clone the specified GitHub repository
RUN git clone https://github.com/WackyDawg/ubiquitous-octo-robot.git

# Change directory to the cloned repository
WORKDIR /ubiquitous-octo-robot

# Install Node.js dependencies (including Puppeteer)
RUN npm install

# Optionally, you can directly install Puppeteer if not in package.json
# RUN npm install puppeteer

# Expose the port the server will run on
EXPOSE 9806

# Run the Express server
CMD ["node", "server.js"]
