FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

FROM nginx
# need EXPOSE for elastic beanstalk to expose the port when deploying
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html