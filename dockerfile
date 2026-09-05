FROM node:25.9-alpine

RUN apk add --no-cache openssl

WORKDIR /usr/src/app

COPY package.json ./
COPY package-lock.json ./

RUN npm ci

COPY . .

RUN npx prisma generate

EXPOSE 3002