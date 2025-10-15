# Simple nginx serving static index.html
FROM nginx:stable

# Remove default content and add our index
RUN rm -rf /usr/share/nginx/html/*

COPY app/index.html /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

