# Use a base image that includes Node.js and Ethereum dependencies
FROM custom/blockchain-node:latest

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json ./

# Install project dependencies
RUN npm install

# Copy the source code to the working directory
COPY . .

# Expose ports for the front-end application and Ethereum blockchain
EXPOSE 3000
EXPOSE 8545

# Command to run the application
CMD ["npm", "start"]
