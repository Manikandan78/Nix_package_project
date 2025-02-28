#!/bin/bash

echo " Checking for requirements.txt..."
if [ ! -f "requirements.txt" ]; then
    echo " requirements.txt not found! Exiting..."
    exit 1
fi

echo " requirements.txt found. Setting up a virtual environment..."
python -m venv myenv
source myenv/bin/activate

echo " Installing dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

echo " Installation complete!"

