# pulling the latest node base image
FROM node:latest

#setting the current working directory
WORKDIR /usr/src/app

#copy the package.json files
COPY package*.json ./

# download the modules
RUN npm install

#copy over the code
COPY . .

#Change the config.json to change the expose port
EXPOSE 8080

#run the app.js
CMD [ "node", "app.js" ]