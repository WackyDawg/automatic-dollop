FROM node:slim AS app

# We don't need the standalone Chromium
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

# Install Google Chrome Stable, fonts, and neofetch
# Note: this installs the necessary libs to make the browser work with Puppeteer.
RUN apt-get update && apt-get install -y \
  curl \
  gnupg \
  neofetch \
  git \
  && curl --location --silent https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
  && apt-get update \
  && apt-get install -y \
    google-chrome-stable \
    --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*


# Clone the specified GitHub repository
RUN git clone https://github.com/WackyDawg/automatic-dollop.git

# Change directory to the cloned repository
WORKDIR /automatic-dollop

RUN neofetch

# Install Puppeteer
RUN npm install puppeteer express

# Command to run your app (adjust as needed)
CMD ["node", "server.js"]
