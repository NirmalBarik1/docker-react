FROM node:alpine as builder

WORKDIR /app

COPY package.json .

# install dependency

RUN npm install 

COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
