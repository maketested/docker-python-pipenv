FROM python:3.6.1-alpine

RUN apk --update add ca-certificates wget && \
    update-ca-certificates

# Tooling

RUN apk add make gcc
RUN apk add musl-dev linux-headers libxml2-dev libxslt-dev

# Pipenv

RUN pip install pipenv~=5.1.1 && \
    pipenv --version

# PostgreSQL

RUN apk add postgresql-dev

# Firefox

RUN apk --update --no-cache add firefox && \
    rm -rf /tmp/* /var/cache/apk/* && \
    firefox --version

RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.17.0/geckodriver-v0.17.0-linux64.tar.gz && \
    tar -xvzf geckodriver-v0.17.0-linux64.tar.gz && \
    chmod +x geckodriver && \
    cp geckodriver /usr/local/bin/ && \
    geckodriver --version
