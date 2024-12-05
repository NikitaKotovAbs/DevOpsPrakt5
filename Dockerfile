FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    openjdk-11-jre \
    x11-apps \
    xauth \
    && rm -rf /var/lib/apt/lists/*

ENV DISPLAY=host.docker.internal:0

COPY calc.jar /usr/local/app/calc.jar

WORKDIR /usr/local/app

RUN echo '#!/bin/bash\n\
xeyes &\n\
java -jar /usr/local/app/calc.jar\n' > start.sh \
    && chmod +x start.sh

CMD ["./start.sh"]
