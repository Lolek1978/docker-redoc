FROM nginx:1.13.9-alpine
ENV PAGE_TITLE=ReDoc
ENV SPEC_URL=swagger.yaml
ENV REDOC_OPTIONS=
COPY run.sh /run.sh
RUN chgrp -R 0 /usr/share/nginx/html 
RUN chmod -R g+rwX /usr/share/nginx/html
RUN chgrp -R 0 /var/cache/nginx/client_temp
RUN chmod -R g+rwX /var/cache/nginx/client_temp
USER 333
CMD ["/run.sh"]
COPY . /usr/share/nginx/html/
USER 1001

CMD ["nginx", "-g", "daemon off;"]