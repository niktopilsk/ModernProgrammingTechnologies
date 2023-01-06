FROM node:14.16.1

WORKDIR /usr/src/nikto_mpt_app

COPY package*.json ./

RUN npm install

COPY . .

CMD ["npm", "run", "start"]