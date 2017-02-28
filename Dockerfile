# FROM mhart/alpine-node:7.6
FROM node:7.6-alpine

# RUN useradd --user-group --create-home --shell /bin/false app &&\
#   npm install --global npm@3.7.5

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json /usr/src/app

# RUN cd $(npm root -g)/npm \
#   && npm install fs-extra \
#   && sed -i -e s/graceful-fs/fs-extra/ -e s/fs\.rename/fs.move/ ./lib/utils/rename.js

# RUN npm i -g node-pre-gyp
# RUN npm i -g node-gyp
RUN npm i -g nodemon
RUN npm install

# ONBUILD RUN virtualenv /env && /env/bin/pip install -r /app/requirements.txt
# RUN npm config set python /usr/bin/python
# RUN npm i --save-dev chai codecov eslint istanbul mocha mocha-istanbul nodemon supertest
# RUN npm i -S bcrypt good good-console good-squeeze hapi hapi-auth-jwt2 inert joi jsonwebtoken nunjucks-hapi pg vision node xlsx
# RUN npm install

ONBUILD ADD . /usr/src/app

# Because of Bcrypt, which uses C binaries, we can't just use the local
# files as a volume on the container while developing :( At least for 
# now, can probably figure out a way to do so (dev/prod environment design)

# Bundle app source
# COPY ./env /usr/src/app
# COPY ./.eslintignore /usr/src/app
# COPY ./__MACOSX /usr/src/app
# COPY ./api /usr/src/app
# COPY ./clientcheckintable.js /usr/src/app
# COPY ./codecov.yml /usr/src/app
# COPY ./config /usr/src/app
# COPY ./package.json /usr/src/app
# COPY ./resources /usr/src/app
# COPY ./routes /usr/src/app
# COPY ./server.js /usr/src/app
# COPY ./static /usr/src/app
# COPY ./templates /usr/src/app
# COPY ./test /usr/src/app
# RUN npm install

EXPOSE 8080

CMD npm run docker-nodemon
