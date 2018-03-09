FROM mediawiki:1.30

ENV DUMPFILE /var/www/html/dump.xml

RUN mkdir /data
RUN chown www-data:www-data /data

# Initial configuration:
RUN php maintenance/install.php --dbtype sqlite --pass administrator  --scriptpath "" wiki admin
RUN chown 501:staff /var/www/html/LocalSettings.php

# Import dump:
COPY dump.xml $DUMPFILE
RUN php maintenance/importDump.php $DUMPFILE
RUN rm $DUMPFILE

