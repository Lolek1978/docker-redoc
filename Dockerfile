FROM nginx:1.13.9-alpine
ENV PAGE_TITLE=ReDoc
ENV SPEC_URL=swagger.yaml
ENV REDOC_OPTIONS=
COPY run.sh /run.sh
RUN chgrp -R 0 /usr/share/nginx/html 
RUN chmod -R g+rwX /usr/share/nginx/html
USER 333
CMD ["/run.sh"]
COPY . /usr/share/nginx/html/
