FROM node AS builder
WORKDIR /app
COPY ./package.json ./
RUN yarn
COPY . .
RUN yarn build

FROM node-alpine
WORKDIR /app
COPY --from=builder /app/dist ./
CMD ["yarn", "start:prod"]
