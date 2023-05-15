FROM alpine:latest
RUN apk update && \
    apk add --no-cache python3-dev git curl gcc musl-dev libffi-dev libxml2-dev libxslt-dev openssl-dev && \
    python3 -m ensurepip && \
    pip3 install --upgrade pip waitress && \
    rm -rf /var/cache/apk/*
COPY . /usr/local/src/RSSFeedGenerator
WORKDIR /usr/local/src/RSSFeedGenerator
RUN pip3 install --no-binary :all: -r requirements.txt
ENTRYPOINT ["python3", "app.py"]
