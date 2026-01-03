#!/bin/bash

# Aguarda o MySQL estar pronto
echo "Aguardando MySQL..."
until php artisan migrate:status > /dev/null 2>&1; do
    echo "Aguardando conexão com MySQL..."
    sleep 2
done

echo "Executando migrations..."*-;
php artisan migrate --force

echo "Iniciando servidor Laravel..."
php artisan serve --host=0.0.0.0 --port=8000