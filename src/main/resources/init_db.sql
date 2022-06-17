CREATE SCHEMA if NOT EXISTS `taxi_service` DEFAULT CHARACTER SET utf8;
USE
`taxi_service`;

DROP TABLE if EXISTS `manufacturers`;
CREATE TABLE `manufacturers`
(
    `id`         bigint(11) NOT NULL AUTO_INCREMENT,
    `name`       varchar(225) NOT NULL,
    `country`    varchar(225) NOT NULL,
    `is_deleted` tinyint      NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`)
);

DROP TABLE if EXISTS `drivers`;
CREATE TABLE `drivers`
(
    `id`             bigint(11) NOT NULL AUTO_INCREMENT,
    `name`           varchar(225) NOT NULL,
    `license_number` varchar(225) NOT NULL,
    `is_deleted`     tinyint      NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (id ASC) VISIBLE,
    UNIQUE INDEX `license_number_UNIQUE` (`license_number` ASC) VISIBLE
);

DROP TABLE if EXISTS `cars`;
CREATE TABLE `cars`
(
    `id`              bigint(11) NOT NULL AUTO_INCREMENT,
    `manufacturer_id` bigint(11) NOT NULL,
    `model`           varchar(225) NOT NULL,
    `is_deleted`      tinyint      NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `cars_manufacturers_fk`
        FOREIGN KEY (`manufacturer_id`)
            REFERENCES `manufacturers` (`id`)
            ON UPDATE NO ACTION
            ON DELETE NO ACTION
);

DROP TABLE if EXISTS `cars_drivers`;
CREATE TABLE `cars_drivers`
(
    `driver_id` bigint(11) NOT NULL,
    `car_id`    bigint(11) NOT NULL,
    CONSTRAINT `cars_drivers_drivers_fk`
        FOREIGN KEY (`driver_id`)
            REFERENCES `drivers` (`id`)
            ON UPDATE NO ACTION
            ON DELETE NO ACTION,
    CONSTRAINT `cars_drivers_cars_fk`
        FOREIGN KEY (`car_id`)
            REFERENCES `cars` (`id`)
            ON UPDATE NO ACTION
            ON DELETE NO ACTION
);
