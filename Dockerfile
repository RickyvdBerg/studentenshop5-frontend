
# stage 1

FROM node:alpine AS studentenshop5
WORKDIR /app
COPY . .
RUN npm ci && npm run build

# stage 2

FROM nginx:alpine
COPY --from=studentenshop5 /app/dist/studentenshop5 /usr/share/nginx/html
EXPOSE 80