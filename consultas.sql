DELIMITER //

DROP PROCEDURE IF EXISTS `consultas_alejandro_juarez` //

CREATE DEFINER=`root`@`%` PROCEDURE `consultas_alejandro_juarez`()
BEGIN

-- Consultas --

-- Unión --


-- Intersección --


-- Diferencia --


-- Agregación --


-- Reunion natural --


-- Reunion natural por la izquierda --


-- Reunion natural por la derecha --


-- Producto cartesiano --


END //

DELIMITER ;


DELIMITER //

DROP PROCEDURE IF EXISTS `consultas_miguel_rivas` //

CREATE DEFINER=`root`@`%` PROCEDURE `consultas_miguel_rivas`()
BEGIN

-- Consultas --
-- Interseccion --

-- Union --

-- Diferencia --

-- Agregacion --

-- Reunion Natural --

-- Reunion Natural por derecha --


-- Reunion Natural por izquierda --

-- Producto cartesiano --

END //

DELIMITER ;


DELIMITER //

DROP PROCEDURE IF EXISTS `consultas_kelvia_neves` //

CREATE DEFINER=`root`@`%` PROCEDURE `consultas_kelvia_neves`()
BEGIN

-- Consultas --

-- Unión Kelvia –


-- Intersección Kelvia --


-- Diferencia Kelvia --


--  Agregación Kelvia --


-- Reunion natural Kelvia --


-- Reunion natural por la izquierda Kelvia --


-- Reunion natural por la derecha Kelvia --


-- Producto cartesiano Kelvia --



END //

DELIMITER ;


DELIMITER //

DROP PROCEDURE IF EXISTS `consultas_manuel_munoz` //

CREATE DEFINER=`root`@`%` PROCEDURE `consultas_manuel_munoz`()
BEGIN

-- Consultas --

-- Intersect --

-- Union --


-- Diferencia --

-- Agregacion --

-- Natural Join --


-- Right Join --

-- Left Join --

--  P.Cartesiano -- 

END //

DELIMITER ;


DELIMITER //

DROP PROCEDURE IF EXISTS `consultas_carlos_alvarado` //

CREATE DEFINER=`root`@`%` PROCEDURE `consultas_carlos_alvarado`()
BEGIN

-- Consultas Carlos Alvarado --


-- Intersección --

SELECT * FROM reserva WHERE codigo_unico LIKE 'AB%' INTERSECT SELECT * FROM reserva WHERE costo > 100.00;


-- Diferencia --

SELECT * FROM reserva WHERE codigo_unico LIKE 'A%' EXCEPT SELECT * FROM reserva WHERE costo > 125.00;

-- Unión --

SELECT * FROM reserva WHERE codigo_unico LIKE '%10%' UNION SELECT * FROM reserva WHERE estado = 'Confirmada';

-- Agregación --

SELECT AVG(costo) FROM reserva WHERE estado = 'Pendiente';

-- Trigger Invidivual --

DELIMITER $$

CREATE TRIGGER valida_fechas_reserva
BEFORE INSERT ON reserva
FOR EACH ROW
BEGIN
    -- Verificar que la fecha de entrada no sea posterior a la fecha de salida
    IF NEW.fecha_entrada > NEW.fecha_salida THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La fecha de entrada no puede ser posterior a la fecha de salida.';
    END IF;
END$$

DELIMITER ;


-- Trigger Grupal --

DELIMITER $$

CREATE TRIGGER elimina_huespedes_reserva
AFTER DELETE ON reserva
FOR EACH ROW
BEGIN
    -- Eliminar registros relacionados en la tabla reserva_huesped
    DELETE FROM reserva_huesped
    WHERE reserva_id = OLD.reserva_id;
END$$

DELIMITER ;


-- Reunión Natural --

SELECT * FROM reserva NATURAL JOIN reserva_habitacion;


-- Reunión Natural Por la izquierda --

SELECT r.codigo_unico, h.tarifa_por_noche FROM reserva AS r LEFT JOIN reserva_habitacion AS rh ON rh.reserva_id = r.reserva_id LEFT JOIN habitacion AS h ON h.habitacion_id = rh.habitacion_id;


-- Reunión Natural Por la derecha --

SELECT r.codigo_unico, h.nombre_completo FROM reserva AS r RIGHT JOIN reserva_huesped AS rh ON rh.reserva_id = r.reserva_id RIGHT JOIN huesped AS h ON h.huesped_id = rh.huesped_id;


-- Producto Cartesiano --

SELECT r.codigo_unico, h.nombre_completo FROM reserva r CROSS JOIN reserva_huesped rh CROSS JOIN huesped h;

END //

DELIMITER ;
