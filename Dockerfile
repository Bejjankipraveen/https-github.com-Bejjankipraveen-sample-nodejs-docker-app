FROM mhart/alpine-node:12

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies

COPY package*.json ./
# Bundle app source
COPY . .
RUN npm install
RUN touch /var/log/script.log
ADD crontab.txt /crontab.txt
ADD script.sh /script.sh
COPY entry.sh /entry.sh
RUN chmod 755 /script.sh /entry.sh
RUN /usr/bin/crontab /crontab.txt

EXPOSE 8080
CMD ["/entry.sh"]
