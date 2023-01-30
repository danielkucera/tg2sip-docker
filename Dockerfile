FROM alpine:latest as downloader

WORKDIR /files
RUN wget https://github.com/Infactum/tg2sip/releases/download/v1.3.0/tg2sip_bionic.zip
RUN unzip tg2sip_bionic.zip 
RUN chmod +x * 

FROM ubuntu:latest

RUN apt update && apt install -y libopus0 libssl1.1

COPY --from=downloader /files/tg2sip /usr/bin
COPY --from=downloader /files/gen_db /usr/bin

WORKDIR /opt/tg2sip

CMD [ "tg2sip" ]

