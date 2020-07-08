/*
    Ejercicio 3.
*/
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE; 

CREATE USER usr_per_consu;
CREATE USER usr_pro_consu;
CREATE USER usr_est_consu;

CREATE USER usr_per_total;
CREATE USER usr_pro_total;
CREATE USER usr_est_total;

CREATE USER usr_total_consu;


GRANT rol_per_consu TO usr_per_consu;
GRANT rol_pro_consu TO usr_pro_consu;
GRANT rol_est_consu TO usr_est_consu;

GRANT rol_per_total TO usr_per_total;
GRANT rol_pro_total TO usr_pro_total;
GRANT rol_est_total TO usr_est_total;

GRANT rol_total_consu TO usr_total_consu;
