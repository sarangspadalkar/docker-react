#Build Phase
FROM node:alpine as builder
WORKDIR /app
COPY ./package.json ./
RUN npm install 
RUN npm config set unsafe-perm true
COPY  ./ ./
RUN npm run build

#Run Phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
