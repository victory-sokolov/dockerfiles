FROM nginx:alpine

COPY nginx.conf /etc/nginx/
COPY symfony.conf /etc/nginx/conf.d/default.conf

CMD ["nginx"]

EXPOSE 80
EXPOSE 443
