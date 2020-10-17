FROM node:12.19.0-alpine
RUN apk add --no-cache python make g++
RUN npm i --unsafe-perm --no-optional -g aglio@2.3.0
RUN npm i --no-optional -g drakov@1.0.4
WORKDIR /aglio
ADD aglio /aglio
RUN aglio --theme-full-width -i example.apib -o index.html
RUN aglio --compile -i example.apib -o compile.apib
EXPOSE 3000
CMD ["drakov", "-f", "compile.apib", "-s", "/aglio", "--public"]
