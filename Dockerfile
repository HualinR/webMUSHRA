FROM php:7.0-apache
# COPY ./ /var/www/html/

# Add `www-data` to group `appuser`
RUN addgroup --gid 1000  ; \
  adduser --uid 1000 --gid 1000 --disabled-password  ; \
  adduser www-data  ;

COPY ./src /var/www/html

# Add group write access to `storage`
RUN chmod -R 760 /var/www/html/storage

# Set www-data to have UID 1000
RUN usermod -u 1000 www-data
