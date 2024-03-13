#COMMANDS POSTGRESQL
-- Function: validacionclv(character varying)

-- DROP FUNCTION validacionclv(character varying);

CREATE OR REPLACE FUNCTION validacionclv(IN clvavglex character varying, OUT cc bigint)
  RETURNS bigint AS
$BODY$
SELECT count(*) FROM padfis where clave5 = clvavglex; 
$BODY$
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION validacionclv(character varying)
  OWNER TO postgres;


-- Function: validaciondomc(character varying, character varying, character varying)

-- DROP FUNCTION validaciondomc(character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION validaciondomc(IN munx character varying, IN textoigcm1 character varying, IN textoigcm2 character varying, OUT cc bigint)
  RETURNS bigint AS
$BODY$
SELECT count(*) FROM padfis where  municipio = munx and domicilio like textoigcm1 or domfis like textoigcm2;
$BODY$
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION validaciondomc(character varying, character varying, character varying)
  OWNER TO postgres;



-- Function: validacionpropietario(character varying, character varying)

-- DROP FUNCTION validacionpropietario(character varying, character varying);

CREATE OR REPLACE FUNCTION validacionpropietario(IN munx character varying, IN textoigcm1 character varying, OUT cc bigint)
  RETURNS bigint AS
$BODY$
---SELECT count(*) FROM padfis where  municipio = munx and domicilio like textoigcm1 or domfis like textoigcm2;
SELECT count(*) FROM padfis where  municipio = munx and  pmnprop like textoigcm1 ;
$BODY$
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION validacionpropietario(character varying, character varying)
  OWNER TO postgres;




