# Use an official Node.js runtime as a base image
FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the entire application to the container
COPY . .

# Build the production version of the app
RUN npm run build

# Expose the port the app will listen on
EXPOSE 3000

# Define the command to run your app using serve (you can also use npm start here)
CMD ["npx", "serve", "-s", "build"]

