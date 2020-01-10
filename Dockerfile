FROM mongo

RUN apt-get update && apt-get -y install awscli

WORKDIR /app
COPY . /app
RUN chmod u+x /app/init.sh
EXPOSE 27017
CMD /app/init.sh
# CMD /app/init.sh && tail -f /dev/null