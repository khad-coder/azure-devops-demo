#!/bin/bash
set -e  # Arrêter le script en cas d'erreur

echo "---------------------------------------"
echo "Configuration de l’environnement de développement"
echo "---------------------------------------"

# Mettre à jour les paquets
echo "Mise à jour des paquets..."
sudo apt-get update -y

# Vérifier si curl est installé avant d'essayer de l'installer
if ! command -v curl &> /dev/null; then
  echo "Installation de curl..."
  sudo apt-get install -y curl
else
  echo "✅ Curl déjà installé"
fi

# Installer git
if ! command -v git &> /dev/null; then
  echo "Installation de Git..."
  sudo apt-get install -y git
else
  echo "✅ Git déjà installé"
fi

# Installer Node.js
echo "Installation de Node.js..."
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

# Vérifier l'installation de Node.js
node -v && echo "✅ Node.js installé"

# Installer yarn
echo "Installation de Yarn..."
npm install -g yarn

# Vérifier l'installation de Yarn
yarn --version && echo "✅ Yarn installé"

# Installer les dépendances du projet si package.json existe
if [ -f "package.json" ]; then
  echo "Installation des dépendances npm du projet..."
  yarn install || npm install
else
  echo "⚠️ Aucun fichier package.json trouvé, installation ignorée"
fi

echo "---------------------------------------"
echo "✅ Environnement prêt !"
echo "---------------------------------------"
