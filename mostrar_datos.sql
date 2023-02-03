SELECT m.nombre as marca, m2.nombre as modelo, ge.nombre as grupo_empresarial, 
c.fechacompra as fecha_compra, c.matricula, c2.nombre as color, c.kilometros as km, a.nombre as aseguradora, c.numpoliza as poliza
FROM practica.marca m 
JOIN practica.modelo m2 ON m.idmodelo = m2.id 
join practica.grupo_empresarial ge on ge.idmarca = m.id 
join practica.coche c on m.id = c.idmarca
join practica.color c2 on c.idcolor = c2.id 
join practica.aseguradora a on c.idaseguradora = a.id order by fecha_compra desc