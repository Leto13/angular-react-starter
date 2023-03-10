FROM node:alpine as builder

WORKDIR ./
COPY package.json package-lock.json ./
ENV CI=1
RUN npm ci

COPY . .
RUN npm run build -- --prod --output-path=/.

FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /dist /angular-react-starter/angular/nginx.conf


ENTRYPOINT ["nginx", "-g", "daemon off;"]
