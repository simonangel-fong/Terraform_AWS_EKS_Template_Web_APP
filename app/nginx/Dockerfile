FROM nginx:1.27-alpine
COPY ./html /usr/share/nginx/html
COPY ./config/site.conf /etc/nginx/conf.d/default.conf
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]