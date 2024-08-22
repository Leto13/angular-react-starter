# Step 1: Build the Angular app
FROM node:18-alpine AS build

# Set working directory
WORKDIR /app

# Copy the of angular code
COPY ./angular /app

# Install dependencies
RUN npm install

# List directory
RUN ls -la /app

# Build the Angular app
RUN npm run build

# Step 2: Set up Nginx to serve the Angular app
FROM nginx:alpine

# Copy the built Angular app from the previous stage
COPY --from=build /app/dist/angular-starter /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
