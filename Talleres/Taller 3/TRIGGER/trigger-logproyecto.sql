CREATE OR REPLACE TRIGGER LOGPROYECTO AFTER INSERT OR DELETE OR UPDATE ON PROYECTO
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

insert into logproyecto
values(to_char(sysdate,'month dd, yyyy hh24 : mi : ss'),tipoaccion,user);

end;