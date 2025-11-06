FROM node:18-alpine AS build

WORKDIR /usr/src/appcode

COPY package*.json ./

RUN npm install

COPY . . 

#stage2: runtime
FROM node:18-alpine

WORKDIR /usr/src/appcode

COPY --from=build /usr/src/appcode /usr/src/appcode

EXPOSE 3000

CMD ["node", "appcode.js"]