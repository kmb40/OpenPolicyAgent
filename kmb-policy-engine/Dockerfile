# Start with the official Nginx base image.
FROM nginx:latest

# Remove the default Nginx configuration.
RUN rm /etc/nginx/conf.d/default.conf

# Copy your custom nginx.conf file into the container.
COPY nginx/nginx.conf /etc/nginx/conf.d/

# Copy your website files into the Nginx web root directory.
# COPY html /usr/share/nginx/html
COPY html /opt/homebrew/var/www

# Expose port 80 to the host machine.
EXPOSE 80