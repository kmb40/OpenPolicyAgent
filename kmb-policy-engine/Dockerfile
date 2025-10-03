# Start with the official Nginx base image.
FROM nginx:latest

# Remove the default Nginx configuration.
# RUN rm /etc/nginx/conf.d/default.conf

# Copy your custom nginx.conf file into the container.
# COPY nginx/nginx.conf /etc/nginx/conf.d/

# Copy your website files into the Nginx web root directory.
# COPY html /usr/share/nginx/html
# COPY html /opt/homebrew/var/www

# Expose port 80 to the host machine.
EXPOSE 80

# COPY ./index.html /usr/share/nginx/html/index.html
COPY ./index.html /opt/homebrew/var/www/index.html
COPY ./nginx.conf /etc/nginx/nginx.conf   # Optional, if you customize config

# Copy the entire kmb-policy-engine directory to the web root
# COPY ./kmb-policy-engine/ /usr/share/nginx/html/
