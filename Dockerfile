FROM node:7.6-alpine

# Script to stop root usage - needs tinkering
# RUN useradd --user-group --create-home --shell /bin/false app &&\
#   npm install --global npm@3.7.5

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN npm i -g nodemon

# Because of Bcrypt, which uses C binaries, we can't just use the local
# files as a volume on the container while developing :( At least for 
# now, can probably figure out a way to do so (dev/prod environment design)
# NB: Had to switch to bcrypt-nodejs module until I can figure out
# why bcrypt module isn't playing nice with docker container

# Bundle app source
COPY . /usr/src/app/
RUN npm install --no-bin-links

EXPOSE 8080

CMD npm run docker-nodemon
