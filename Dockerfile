FROM node:11.15.0-alpine

WORKDIR /home/iquidus

RUN apk --no-cache --virtual builddeps add git python py-pip make gcc g++ krb5-dev

RUN adduser -s /bin/ash -S -u 1001 iquidus && \
    cd /home/iquidus && \
    git clone https://github.com/bitstar/explorer.git explorer && \
    cd explorer && \
    npm install --production && \
    chown -R iquidus /home/iquidus/explorer
    
USER iquidus

EXPOSE 3001

CMD [ "npm", "start"]
