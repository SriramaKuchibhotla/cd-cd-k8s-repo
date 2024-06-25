# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory
WORKDIR /dance360/src/app

# Copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React application
RUN npm run build:core

# Install a simple static file server
RUN npm install -g serve

# Expose the port the app runs on
EXPOSE 3000

# Define the command to serve the app
CMD ["serve", "-s", "dist/core"]