create or replace TRIGGER LOGPROYECTODETALLE BEFORE INSERT OR DELETE OR UPDATE ON PROYECTO  FOR EACH ROW 

declare
tipoaccion char(1);

begin
if inserting then
   tipoaccion :='I';
   elsif updating then
         tipoaccion :='U';
         else
         tipoaccion :='D';
end if;

insert into logproyectodetalle values(:old.identificador_proyecto, :old.identificador_cliente, :old.identificador_tipo_proyecto, :old.nombre,
:new.identificador_proyecto, :new.identificador_cliente, :new.identificador_tipo_proyecto, :new.nombre, to_char(sysdate,'month dd, yyyy hh24 : mi : ss'),user,tipoaccion);

end;