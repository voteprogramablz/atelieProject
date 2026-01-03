#!/bin/bash

# Adicionar no seu ~/.bashrc ou ~/.zshrc
echo 'alias artisan="docker-compose exec laravel php artisan"' >> ~/.bashrc

# Recarregar o terminal
source ~/.bashrc
