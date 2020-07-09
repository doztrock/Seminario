/* 
    Ejercicio 1.
*/
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;  

CREATE ROLE rol_per_consu;
CREATE ROLE rol_pro_consu;
CREATE ROLE rol_est_consu;

CREATE ROLE rol_per_total;
CREATE ROLE rol_pro_total;
CREATE ROLE rol_est_total;

GRANT SELECT ON persona TO rol_per_consu;
GRANT SELECT, INSERT, UPDATE, DELETE ON persona TO rol_per_total;

GRANT SELECT ON profesor TO rol_pro_consu;
GRANT SELECT ON cargo TO rol_pro_consu;
GRANT SELECT, INSERT, UPDATE, DELETE ON profesor TO rol_pro_total;
GRANT SELECT, INSERT, UPDATE, DELETE ON cargo TO rol_pro_total;

GRANT SELECT ON estudiante TO rol_est_consu;
GRANT SELECT ON colegio TO rol_est_consu;
GRANT SELECT, INSERT, UPDATE, DELETE ON estudiante TO rol_est_total;
GRANT SELECT, INSERT, UPDATE, DELETE ON colegio TO rol_est_total;
