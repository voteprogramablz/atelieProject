FROM laravelsail/php82-composer:latest

# Instalar dependências do sistema
RUN apt-get update && apt-get install -y \
    git \
    curl \
    iputils-ping \
    net-tools \
    telnet \
    vim

# Limpar cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Instalar extensões PHP
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Configurar diretório de trabalho
WORKDIR /app

# Copiar script de inicialização
COPY start-app.sh /start-app.sh
RUN chmod +x /start-app.sh

# Expor porta
EXPOSE 8000

# Comando padrão
CMD ["/start-app.sh"]
