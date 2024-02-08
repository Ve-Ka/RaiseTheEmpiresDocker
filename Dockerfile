FROM debian:latest
RUN apt update
RUN apt install -y python3 python3-pip git wget
WORKDIR /app
RUN wget https://raw.githubusercontent.com/Ve-Ka/RaiseTheEmpiresDocker/main/entry.sh
RUN chmod u+x /entry.sh
EXPOSE 80
ENTRYPOINT ["/entry.sh"]
