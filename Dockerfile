FROM node:14.9 as builder

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY ./ ./

#EXPOSE 3000
 
CMD npm run build

# Copy over the build content of app, there must be a single FROM,
# nginx will take control of prvious bloak
FROM nginx
COPY --from=builder /usr/src/app/build /usr/share/nginx/html


