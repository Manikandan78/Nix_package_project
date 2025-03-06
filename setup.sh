#!/bin/bash

# Step 1: Clone the Repository
REPO_URL="git@github.com:Manikandan78/Nix_package_project.git"
INSTALL_DIR="$HOME/myproject"

echo "🔹 Cloning repository..."
if [ -d "$INSTALL_DIR" ]; then
    echo "Repository already exists. Pulling latest updates..."
    cd "$INSTALL_DIR" && git pull
else
    git clone "$REPO_URL" "$INSTALL_DIR"
    cd "$INSTALL_DIR" || exit 1
fi

# Step 2: Install Nix if Not Installed
echo "🔹 Checking if Nix is installed..."
if ! command -v nix &> /dev/null; then
    echo "Nix is NOT installed. Installing Nix..."
    curl -L https://nixos.org/nix/install | sh
    . "$HOME/.nix-profile/etc/profile.d/nix.sh"
else
    echo " Nix is already installed."
fi

# Step 3: Set Up Environment Using Flakes
echo "🔹 Setting up the environment with Nix Flakes..."
nix develop

# Step 4: Run Install Script
echo "🔹 Running install-requirements.sh..."
chmod +x install-requirements.sh
./install-requirements.sh

# Step 5: Start the Application
echo " Starting the application..."
source myenv/bin/activate
python api.py &  # Run in the background

echo " Setup complete! Your application is running."


