/* 
    Ejercicio 2.
*/
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;  

CREATE ROLE rol_total_consu;
GRANT rol_per_consu, rol_pro_consu, rol_est_consu TO rol_total_consu;
