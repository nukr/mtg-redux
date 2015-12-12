FROM node:5.1.0-wheezy
MAINTAINER nukr <nukrs.w@gmail.com>

# http://bitjudo.com/blog/2014/03/13/building-efficient-dockerfiles-node-dot-js/
COPY package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /opt/app && cp -a /tmp/node_modules /opt/app/

WORKDIR /opt/app
COPY . /opt/app
EXPOSE 3000

# Run app
CMD ["npm", "start"]
