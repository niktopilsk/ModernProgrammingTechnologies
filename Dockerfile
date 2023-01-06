FROM node:14.16.1

WORKDIR /usr/src/nikto_mpt_app

COPY ./backend/package*.json ./backend/
RUN npm install --prefix ./backend
COPY ./backend/common ./backend/common

COPY ./frontend/package*.json ./frontend/
RUN npm install --prefix ./frontend
COPY ./frontend ./frontend

CMD ["npm", "run", "start", "--prefix", "./frontend"]
