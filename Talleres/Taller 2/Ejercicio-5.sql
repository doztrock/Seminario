/*
    Ejercicio 5.
*/
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE; 

CREATE TABLESPACE tb_backup DATAFILE 'dfile_backup' SIZE 20M AUTOEXTEND ON NEXT 10M;

CREATE USER usr_backup IDENTIFIED BY usr_backup DEFAULT TABLESPACE tb_backup TEMPORARY TABLESPACE temp;

GRANT CONNECT TO usr_backup;
GRANT CREATE TABLE TO usr_backup;

GRANT rol_per_consu, rol_pro_consu, rol_est_consu TO usr_backup;

ALTER USER usr_backup QUOTA 100M ON tb_backup;
