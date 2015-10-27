FROM node

MAINTAINER Adrian Mouat <adrian@adrianmouat.com>
ENV http_proxy http://16.153.99.11:8080
ENV https_proxy http://16.153.99.11:8080

RUN git clone https://github.com/hakimel/reveal.js.git /revealjs
# RUN mkdir -p /revealjs/md

WORKDIR /revealjs

RUN npm install -g grunt-cli && npm install
RUN sed -i Gruntfile.js -e 's/port: port,/port: port, hostname: "",/'
#ADD index.html /revealjs/
ADD css /revealjs/css
ADD js /revealjs/js
ADD lib /revealjs/lib
ADD plugin /revealjs/plugin
#ADD test_slides.md /revealjs/md/slides.md

EXPOSE 8000
CMD ["grunt", "serve"]
