FROM nginx

WORKDIR /usr/app

RUN apt-get update -y && apt-get install curl -y
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN sh -c "echo 'deb https://dl.yarnpkg.com/debian/ stable main' >> /etc/apt/sources.list"
RUN apt-get update -y && apt-get install nodejs -y && apt-get --no-install-recommends install yarn -y
COPY . .
RUN yarn && yarn build
RUN cp -r /usr/app/build/* /usr/share/nginx/html

EXPOSE 80