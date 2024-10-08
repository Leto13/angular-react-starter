# Step 1: Build the Angular app
FROM node:18-alpine AS build

# Set working directory
WORKDIR /app

# Change directory
RUN cd angular

# Copy the package.json and package-lock.json
COPY package*.json ./

# List directory
RUN ls -la /app

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Angular app
RUN npm run build

# Step 2: Set up Nginx to serve the Angular app
FROM nginx:alpine

# Copy the built Angular app from the previous stage
COPY --from=build /app/dist/angular-starter /usr/share/nginx/html

# Copy custom Nginx configuration if needed
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
