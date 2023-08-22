FROM maven:3.6.3-openjdk-8
EXPOSE 8080
WORKDIR /app
COPY src ./src
COPY pom.xml .
COPY package*.json .
COPY puppet ./puppet
COPY misc ./misc
COPY LICENSE-GPLv3.txt .
COPY sqldump ./sqldump
RUN mvn package
COPY .env .
COPY entrypoint.sh .    
RUN chmod +x entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]