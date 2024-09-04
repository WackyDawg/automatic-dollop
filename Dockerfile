# Use the official Ubuntu image as a base
FROM ubuntu:latest

# Update the package list and install necessary packages
RUN apt update && \
    apt upgrade -y && \
    apt install -y xfce4 wget

# Download and install Chrome Remote Desktop
RUN wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb -P /tmp && \
    apt install --assume-yes /tmp/chrome-remote-desktop_current_amd64.deb

# Clean up the package list to reduce image size
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose any necessary ports (if required by your application)
EXPOSE 8080

# Command to run when starting the container
CMD ["bash"]
