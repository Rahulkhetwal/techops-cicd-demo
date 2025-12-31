FROM ubuntu:22.04

RUN apt update && apt install -y bash

WORKDIR /app

COPY app.sh .

RUN chmod +x app.sh

CMD ["./app.sh"]
