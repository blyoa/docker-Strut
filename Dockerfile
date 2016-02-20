FROM node:4.1.0-slim
ENV REFRESHED_AT 2015_02_20

RUN wget https://github.com/tantaman/Strut/archive/master.tar.gz -O ./Strut.tar.gz \
 && tar zxvf ./Strut.tar.gz \
 && mv Strut-master Strut \
 && rm ./Strut.tar.gz

WORKDIR ./Strut

RUN npm install -g grunt-cli \
 # avoid error:
 #   No compatible version found: phantomjs@'>=1.8.1 <1.9.0'
 # see https://github.com/tantaman/Strut/issues/316
 && npm install grunt-mocha --save-dev \
 && npm install

EXPOSE 9000
CMD ["grunt", "server"]
