FROM debian:latest
MAINTAINER Flo Gu florian.gugganeder@gmail.com

COPY src/* /src/

RUN apt-get update && apt-get install -y python-software-properties software-properties-common postgresql-9.4 postgresql-client-9.4 postgresql-contrib-9.4 

USER postgres

RUN /etc/init.d/postgresql start &&\
  psql --command "create user h0927586 with superuser password 'h0927586';" &&\
  createdb -O h0927586 mission5 &&\
  psql -d mission5 -f /src/init_db.sql &&\
  psql -d mission5 -f /src/masterdata_create.sql &&\
  psql -d mission5 -f /src/import_create.sql &&\
  psql -d mission5 -f /src/import_insert.sql &&\
  psql -d mission5 -f /src/masterdata_insert.sql

RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.4/main/pg_hba.conf

RUN echo "listen_addresses='*'" >> /etc/postgresql/9.4/main/postgresql.conf

EXPOSE 5432

VOLUME ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

CMD ["/usr/lib/postgresql/9.4/bin/postgres", "-D", "/var/lib/postgresql/9.4/main", "-c", "config_file=/etc/postgresql/9.4/main/postgresql.conf"]