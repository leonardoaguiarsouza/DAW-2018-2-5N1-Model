#!/bin/bash
BANCO="DAW-2018-2-5N1"
USUARIO=postgres
SENHA=postgres
HOST=localhost
PORTA=5432
printf "Efetuando backup completo do banco de dados $BANCO"
echo 
export PGUSER=$USUARIO
export PGPASSWORD=$SENHA
#/usr/lib/postgresql/9.6/bin/pg_dump --host $HOST --port $PORTA --username $USUARIO --clean --format c --verbose --file backup_completo.backup $BANCO
/usr/lib/postgresql/9.6/bin/pg_dump --host $HOST --port $PORTA --username $USUARIO -d $BANCO -f backup_completo.sql 
