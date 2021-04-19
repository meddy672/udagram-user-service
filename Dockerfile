FROM node:11.15.0

WORKDIR /usr/app/src

COPY ./www/package.json .

RUN  npm install

COPY ./www .

EXPOSE 8082

CMD ["node", "server.js"]