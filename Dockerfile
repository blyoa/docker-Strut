FROM node:4.3.1-slim
ENV REFRESHED_AT 2016_03_21

RUN wget https://github.com/tantaman/Strut/archive/v0.3.2.tar.gz -O ./Strut.tar.gz \
 && tar zxvf ./Strut.tar.gz \
 && mv Strut-0.3.2 Strut \
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
