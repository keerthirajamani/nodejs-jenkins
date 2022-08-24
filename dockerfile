FROM node
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
RUN npm i -h pm2
COPY . .
EXPOSE 1257
CMD ["npm", "run", "start","index.js"]