#FROM node:alpine as builder
#above line is causing error when deploying to AWS Elastic Beanstalk. dont know the reason.
FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
#COPY --from=builder /app/build /usr/share/nginx/html
COPY --from=0 /app/build /usr/share/nginx/html