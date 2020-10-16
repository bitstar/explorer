FROM node:12-alpine

WORKDIR /home/iquidus

RUN apk --no-cache --virtual builddeps add git python py-pip make gcc g++ krb5-dev && \
    adduser -s /bin/ash -S -u 1001 iquidus && \
    git clone https://github.com/bitstar/explorer.git . && \
    npm install --production && \
    chown -R iquidus /home/iquidus
    
USER iquidus

EXPOSE 3001

CMD [ "npm", "start"]
