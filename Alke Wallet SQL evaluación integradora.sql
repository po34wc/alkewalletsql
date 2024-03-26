create schema alke_wallet;
use alke_wallet;

CREATE TABLE `moneda` (
  `currency_id` int NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(100) NOT NULL,
  `currency_symbol` varchar(1) NOT NULL,
  `country` varchar(45) NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `usuarios` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `correo_electronico` varchar(100) NOT NULL,
  `contrasegna` varchar(50) NOT NULL,
  `saldo` int NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `correo_electronico_UNIQUE` (`correo_electronico`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `transaccion` (
  `transaccion_id` int NOT NULL AUTO_INCREMENT,
  `sender_user_id` int NOT NULL,
  `receiver_user_id` int NOT NULL,
  `importe` int NOT NULL,
  `transaction_date` datetime NOT NULL,
  `currency_id_sender` int NOT NULL,
  `currency_id_receiver` int NOT NULL,
  PRIMARY KEY (`transaccion_id`),
  KEY `transaccion_sender` (`sender_user_id`),
  KEY `transaccion_receiver` (`receiver_user_id`),
  KEY `transaction_currency_idx` (`currency_id_sender`),
  KEY `transaction_currency_receiver_idx` (`currency_id_receiver`),
  CONSTRAINT `transaccion_receiver` FOREIGN KEY (`receiver_user_id`) REFERENCES `usuarios` (`user_id`),
  CONSTRAINT `transaccion_sender` FOREIGN KEY (`sender_user_id`) REFERENCES `usuarios` (`user_id`),
  CONSTRAINT `transaction_currency_receiver` FOREIGN KEY (`currency_id_receiver`) REFERENCES `moneda` (`currency_id`),
  CONSTRAINT `transaction_currency_sender` FOREIGN KEY (`currency_id_sender`) REFERENCES `moneda` (`currency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



ALTER TABLE moneda AUTO_INCREMENT = 1;

INSERT INTO `alke_wallet`.`moneda` (`currency_name`, `currency_symbol`, `country`) VALUES ('Peso', '$', 'Chile');
INSERT INTO `alke_wallet`.`moneda` (`currency_name`, `currency_symbol`, `country`) VALUES ('Dólar', '$', 'Estados Unidos');
INSERT INTO `alke_wallet`.`moneda` (`currency_name`, `currency_symbol`, `country`) VALUES ('Euro', '€', 'Europa');
INSERT INTO `alke_wallet`.`moneda` (`currency_name`, `currency_symbol`, `country`) VALUES ('Yen', '¥', 'Japón');
INSERT INTO `alke_wallet`.`moneda` (`currency_name`, `currency_symbol`, `country`) VALUES ('Yuan', '¥', 'China');
INSERT INTO `alke_wallet`.`moneda` (`currency_name`, `currency_symbol`, `country`) VALUES ('Libra Esterlina', '£', 'Reino Unido');


ALTER TABLE usuarios AUTO_INCREMENT = 1;

INSERT INTO `alke_wallet`.`usuarios` (`nombre`, `correo_electronico`, `contrasegna`, `saldo`) VALUES ('José Pérez', 'jperez@gmail.com', '123', 100);
INSERT INTO `alke_wallet`.`usuarios` (`nombre`, `correo_electronico`, `contrasegna`, `saldo`) VALUES ('María González', 'mgonzalez@gmail.com', '123', 100);
INSERT INTO `alke_wallet`.`usuarios` (`nombre`, `correo_electronico`, `contrasegna`, `saldo`) VALUES ('Jorge Alfaro', 'jalfaro@gmail.com', '123', 100);
INSERT INTO `alke_wallet`.`usuarios` (`nombre`, `correo_electronico`, `contrasegna`, `saldo`) VALUES ('Pedro Fernández', 'pfernandez@gmail.com', '123', 100);



ALTER TABLE transaccion AUTO_INCREMENT = 1;

INSERT INTO `alke_wallet`.`transaccion` (`sender_user_id`, `receiver_user_id`, `importe`, `transaction_date`, `currency_id_sender`, `currency_id_receiver`) VALUES (1, 2, 100, '2024-03-24', 1, 2);
INSERT INTO `alke_wallet`.`transaccion` (`sender_user_id`, `receiver_user_id`, `importe`, `transaction_date`, `currency_id_sender`, `currency_id_receiver`) VALUES (1, 3, 200, '2024-03-24', 1, 3);
INSERT INTO `alke_wallet`.`transaccion` (`sender_user_id`, `receiver_user_id`, `importe`, `transaction_date`, `currency_id_sender`, `currency_id_receiver`) VALUES (1, 4, 300, '2024-03-24', 1, 4);
INSERT INTO `alke_wallet`.`transaccion` (`sender_user_id`, `receiver_user_id`, `importe`, `transaction_date`, `currency_id_sender`, `currency_id_receiver`) VALUES (2, 1, 110, '2024-03-24', 2, 1);
INSERT INTO `alke_wallet`.`transaccion` (`sender_user_id`, `receiver_user_id`, `importe`, `transaction_date`, `currency_id_sender`, `currency_id_receiver`) VALUES (2, 3, 220, '2024-03-24', 2, 3);
INSERT INTO `alke_wallet`.`transaccion` (`sender_user_id`, `receiver_user_id`, `importe`, `transaction_date`, `currency_id_sender`, `currency_id_receiver`) VALUES (2, 4, 330, '2024-03-24', 2, 4);
INSERT INTO `alke_wallet`.`transaccion` (`sender_user_id`, `receiver_user_id`, `importe`, `transaction_date`, `currency_id_sender`, `currency_id_receiver`) VALUES (3, 1, 111, '2024-03-24', 3, 1);
INSERT INTO `alke_wallet`.`transaccion` (`sender_user_id`, `receiver_user_id`, `importe`, `transaction_date`, `currency_id_sender`, `currency_id_receiver`) VALUES (3, 2, 222, '2024-03-24', 3, 2);
INSERT INTO `alke_wallet`.`transaccion` (`sender_user_id`, `receiver_user_id`, `importe`, `transaction_date`, `currency_id_sender`, `currency_id_receiver`) VALUES (3, 4, 333, '2024-03-24', 3, 4);
INSERT INTO `alke_wallet`.`transaccion` (`sender_user_id`, `receiver_user_id`, `importe`, `transaction_date`, `currency_id_sender`, `currency_id_receiver`) VALUES (4, 1, 123, '2024-03-24', 4, 3);
INSERT INTO `alke_wallet`.`transaccion` (`sender_user_id`, `receiver_user_id`, `importe`, `transaction_date`, `currency_id_sender`, `currency_id_receiver`) VALUES (4, 2, 123, '2024-03-24', 4, 2);
INSERT INTO `alke_wallet`.`transaccion` (`sender_user_id`, `receiver_user_id`, `importe`, `transaction_date`, `currency_id_sender`, `currency_id_receiver`) VALUES (4, 3, 123, '2024-03-24', 4, 3);


-- Consulta para obtener el nombre de la moneda elegida por un usuario especíﬁco
SELECT 
	Usuario,
    Moneda,
    count(moneda) AS 'Ocasiones'
FROM (
	SELECT
		u.nombre AS 'Usuario',
		m.currency_name AS 'Moneda'
	FROM usuarios u
	LEFT JOIN transaccion t ON u.user_id = t.sender_user_id
	LEFT JOIN moneda m ON t.currency_id_sender = m.currency_id
	WHERE u.user_id = 1
    
    UNION ALL

	SELECT
		u.nombre AS 'Usuario',
		m.currency_name AS 'Moneda'
	FROM usuarios u
	LEFT JOIN transaccion t ON u.user_id = t.receiver_user_id
	LEFT JOIN moneda m ON t.currency_id_receiver = m.currency_id
	WHERE u.user_id = 1
) usuario_monedas
GROUP BY Usuario, Moneda;



-- Consulta para obtener todas las transacciones registradas
SELECT
	t.transaction_date AS 'Fecha transacción',
	ts.nombre AS 'Remitente',
    m.currency_name AS 'Moneda usada para el envio',
    t.importe AS 'Monto enviado',
    tr.nombre AS 'Receptor'
FROM transaccion t
LEFT JOIN usuarios ts ON t.sender_user_id = ts.user_id
LEFT JOIN usuarios tr ON t.receiver_user_id = tr.user_id
LEFT JOIN moneda m ON t.currency_id_sender = m.currency_id;


-- Consulta para obtener todas las transacciones realizadas por un usuario especíﬁco
SELECT
	t.transaction_date AS 'Fecha transacción',
	ts.nombre AS 'Remitente',
    m.currency_name AS 'Moneda usada para el envio',
    t.importe AS 'Monto enviado',
    tr.nombre AS 'Receptor'
FROM transaccion t
LEFT JOIN usuarios ts ON t.sender_user_id = ts.user_id
LEFT JOIN usuarios tr ON t.receiver_user_id = tr.user_id
LEFT JOIN moneda m ON t.currency_id_sender = m.currency_id
WHERE ts.user_id = 1;


-- Sentencia DML para modiﬁcar el campo correo electrónico de un usuario especíﬁco
UPDATE usuarios SET correo_electronico = 'jperez@gmail.com' WHERE user_id = 1;


-- Sentencia para eliminar los datos de una transacción (eliminado de la ﬁla completa)
DELETE FROM transaccion WHERE transaccion_id = 17;