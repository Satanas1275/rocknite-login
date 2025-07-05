FROM node:18-alpine

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install --production && yarn cache clean

COPY . .

ENV NODE_ENV=production

EXPOSE 1234
CMD ["node", "-r", "esm", "./bin/server", "--port", "1234"]
