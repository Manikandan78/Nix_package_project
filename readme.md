# Automated Python & PostgreSQL Setup with Nix Flakes  

This project automates the installation of **Python 3.11** and **PostgreSQL 15** using **Nix Flakes**. It ensures a consistent development environment across **Linux, Ubuntu (WSL), and macOS**.  

---

## Prerequisites  
Before proceeding, ensure you have:  
- **Nix Package Manager** installed → [Installation Guide](https://nixos.org/download.html)  
- **Flakes enabled** in your Nix configuration:  

## Commands to create a Directory

  ```Create Directory 
  mkdir -p ~/.config/nix
  echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
