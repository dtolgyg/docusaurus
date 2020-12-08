FROM node:15.3.0-buster-slim

LABEL description="Docusaurus v2 for docker on Node 15"

RUN apt-get update -y &&\
    apt-get install nano -y &&\
    apt-get clean
WORKDIR /app
COPY . .
RUN npm -y install http-server
RUN npx -y @docusaurus/init@2.0.0-alpha.66 init my-website classic
RUN npm install ./docusaurus-lunr-search --save
WORKDIR /app/my-website
RUN  npm run swizzle docusaurus-lunr-search SearchBar -- --danger
