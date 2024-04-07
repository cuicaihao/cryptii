# Use the official Node.js 14 image from Docker Hub
FROM node:14

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files to the new working directory
COPY package*.json ./

# Install the project dependencies
RUN npm ci

# Copy the rest of the project files to the working directory
COPY . .

# Build the app
RUN npm run build

# Expose port 8080 for the app to listen on
EXPOSE 8080

# Install express
# RUN npm install express
# CMD [ "node", "server.js" ]

# Run the app
# CMD [ "npm" , "start" ]

# Run the app with python server
CMD [ "python3", "-m", "http.server", "8080" ]


# docker build -t cryptii_app .
# docker run -p 8080:8080 -d cryptii_app