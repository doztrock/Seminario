/*
    Ejercicio 4.
*/
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE; 

CREATE ROLE rol_conexion;

GRANT CREATE SESSION TO rol_conexion;

GRANT rol_conexion TO usr_per_consu;
GRANT rol_conexion TO usr_pro_consu;
GRANT rol_conexion TO usr_est_consu;
GRANT rol_conexion TO usr_per_total;
GRANT rol_conexion TO usr_pro_total;
GRANT rol_conexion TO usr_est_total;
GRANT rol_conexion TO usr_total_consu;