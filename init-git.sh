#!/bin/bash

# Inicia SSH
sudo service ssh start

# Se não existe o .git, clona o repo
if [ ! -d ".git" ]; then
    echo "Clonando repositório..."
    git clone ${GIT_REPO} .
    git checkout ${GIT_BRANCH}
fi

# Configura Git
git config --global user.name "${GIT_USER}"
git config --global user.email "${GIT_USER}@example.com"

# Instala dependências Laravel
if [ -f "composer.json" ]; then
    composer install
fi

if [ -f "package.json" ]; then
    npm install
fi

# Inicia Laravel
php artisan serve --host=0.0.0.0 --port=8000
