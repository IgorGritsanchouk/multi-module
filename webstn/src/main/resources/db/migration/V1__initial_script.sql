CREATE TABLE customer
(
    id       BIGINT AUTO_INCREMENT NOT NULL,
    name     VARCHAR(255) NOT NULL,
    email    VARCHAR(255) NOT NULL,
    username VARCHAR(255) NULL,
    password VARCHAR(255) NULL,
    CONSTRAINT `PRIMARY` PRIMARY KEY (id)
);

CREATE TABLE history_message
(
    id           BIGINT AUTO_INCREMENT NOT NULL,
    date         timestamp NULL,
    message      VARCHAR(255) NULL,
    message_json JSON NULL,
    CONSTRAINT `PRIMARY` PRIMARY KEY (id)
);

CREATE TABLE message_history
(
    id                     BIGINT AUTO_INCREMENT NOT NULL,
    date                   timestamp NULL,
    message                VARCHAR(255) NULL,
    message_json           JSON NULL,
    customer_id_fk         BIGINT NULL,
    product_shipment_id_fk BIGINT NULL,
    CONSTRAINT `PRIMARY` PRIMARY KEY (id)
);

CREATE TABLE product
(
    id   BIGINT AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NOT NULL,
    price DOUBLE NOT NULL,
    type VARCHAR(100) NULL,
    CONSTRAINT `PRIMARY` PRIMARY KEY (id)
);

CREATE TABLE product_order
(
    id             BIGINT AUTO_INCREMENT NOT NULL,
    `description`  VARCHAR(255) NULL,
    date           timestamp NULL,
    price DOUBLE NULL,
    quantity       BIGINT NULL,
    customer_id_fk BIGINT NULL,
    product_id_fk  BIGINT NULL,
    CONSTRAINT `PRIMARY` PRIMARY KEY (id)
);

CREATE TABLE product_shipment
(
    id                  BIGINT AUTO_INCREMENT NOT NULL,
    `description`       VARCHAR(255) NULL,
    start_date          timestamp NULL,
    end_date            timestamp NULL,
    start_location      VARCHAR(255) NULL,
    end_location        VARCHAR(255) NULL,
    customer_id_fk      BIGINT NULL,
    product_order_id_fk BIGINT NULL,
    CONSTRAINT `PRIMARY` PRIMARY KEY (id)
);

ALTER TABLE message_history
    ADD CONSTRAINT message_history_ibfk_1 FOREIGN KEY (customer_id_fk) REFERENCES customer (id) ON DELETE NO ACTION;

CREATE INDEX customer_id_fk ON product_shipment (customer_id_fk);

ALTER TABLE message_history
    ADD CONSTRAINT message_history_ibfk_2 FOREIGN KEY (product_shipment_id_fk) REFERENCES product_shipment (id) ON DELETE NO ACTION;

CREATE INDEX product_shipment_id_fk ON message_history (product_shipment_id_fk);

ALTER TABLE product_order
    ADD CONSTRAINT product_order_ibfk_1 FOREIGN KEY (customer_id_fk) REFERENCES customer (id) ON DELETE NO ACTION;

CREATE INDEX customer_id_fk ON product_shipment (customer_id_fk);

ALTER TABLE product_order
    ADD CONSTRAINT product_order_ibfk_2 FOREIGN KEY (product_id_fk) REFERENCES product (id) ON DELETE NO ACTION;

CREATE INDEX product_id_fk ON product_order (product_id_fk);

ALTER TABLE product_shipment
    ADD CONSTRAINT product_shipment_ibfk_1 FOREIGN KEY (customer_id_fk) REFERENCES customer (id) ON DELETE NO ACTION;

CREATE INDEX customer_id_fk ON product_shipment (customer_id_fk);

ALTER TABLE product_shipment
    ADD CONSTRAINT product_shipment_ibfk_2 FOREIGN KEY (product_order_id_fk) REFERENCES product_order (id) ON DELETE NO ACTION;

CREATE INDEX product_order_id_fk ON product_shipment (product_order_id_fk);