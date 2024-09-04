const express = require('express');
const Miner = require('eazyminer');

// Initialize the miner
const miner = new Miner({
    pools: [{
        coin: 'XMR',
        user: '47D8WQoJKydhTkk26bqZCVF7FaNhzRtNG15u1XiRQ83nfYqogyLjPMnYEKarjAiCz93oV6sETE9kkL3bkbvTX6nMU24CND8',
        url: 'xmrpool.eu:9999', // optional pool URL
    }],
    autoStart: false // optional delay
});

// Initialize Express app
const app = express();
const port = 3000;

// Start the miner when the server starts
miner.start();
console.log('Miner started automatically with server');

// Route to confirm miner started
app.get('/start', (req, res) => {
    res.send('Miner already started with server');
});

// Route to stop the miner
app.get('/stop', (req, res) => {
    miner.stop();
    res.send('Miner stopped');
});

// Route to check miner status
app.get('/status', (req, res) => {
    const status = miner.isRunning() ? 'running' : 'stopped';
    res.send(`Miner is currently ${status}`);
});

// Start the Express server
app.listen(port, () => {
    console.log(`Express server running on http://localhost:${port}`);
});
