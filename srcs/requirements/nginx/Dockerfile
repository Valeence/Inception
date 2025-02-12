FROM debian:bullseye-slim

# Install nginx
RUN apt-get update && apt upgrade && apt-get install -y nginx && apt install openssl -y
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=vandre.42.fr/UID=vandre"
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Copy the configuration file
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Expose the port
EXPOSE 443

# Start the service
CMD ["nginx", "-g", "daemon off;"]