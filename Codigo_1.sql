-- ----------------------------------------------------------
-- Author julian mazo jrtma34@gmail.com
-- Version: 0.0.0
-- ----------------------------------------------------------
-- -----------------------------------------------------
-- Schema store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS storejr DEFAULT CHARACTER SET utf8mb4 ;
USE storejr ;



CREATE TABLE IF NOT EXISTS Action_supp (
  id_Action_supp INT NOT NULL AUTO_INCREMENT,
  product VARCHAR(100) NULL,
  supplier VARCHAR(100) NULL,
  fecha DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id_Action_supp));


-- -----------------------------------------------------
-- Table store
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS store (
  store_id INT NOT NULL AUTO_INCREMENT,
  store_name VARCHAR(45) NOT NULL,
  store_address  VARCHAR(45) NOT NULL,
  PRIMARY KEY (store_id)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table seller
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS seller (
  seller_id INT NOT NULL AUTO_INCREMENT,
  seller_name VARCHAR(45) NOT NULL,
  seller_lastname VARCHAR(45) NOT NULL,
  create_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (seller_id)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table document type
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS documenttype (
  documenttype_id INT NOT NULL AUTO_INCREMENT,
  documenttype_type VARCHAR(45) NOT NULL,
  create_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (documenttype_id)
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table clientt
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS clientt (
  clientt_id INT NOT NULL AUTO_INCREMENT,
  documenttype_documenttype_id INT NOT NULL,
  clientt_number VARCHAR(45) NOT NULL,
  clientt_name VARCHAR(45) NOT NULL,
  PRIMARY KEY (clientt_id),
  INDEX fk_clientt_documenttype_idx (documenttype_documenttype_id ASC) VISIBLE,
  CONSTRAINT fk_clientt_documenttype
    FOREIGN KEY (documenttype_documenttype_id)
    REFERENCES documenttype (documenttype_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table supplier
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS supplier (
  supp_id INT NOT NULL AUTO_INCREMENT,
  supp_name VARCHAR(45) NOT NULL,
  supp_phone VARCHAR(45) NOT NULL,
  PRIMARY KEY (supp_id)
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table product
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS product (
  product_id INT NOT NULL AUTO_INCREMENT,
  supp_supp_id INT NOT NULL,
  product_name VARCHAR(45) NOT NULL,
  product_price DOUBLE NOT NULL,
  PRIMARY KEY (product_id),
  INDEX fk_product_supp_idx (supp_supp_id ASC) VISIBLE,
  CONSTRAINT fk_product_supp
    FOREIGN KEY (supp_supp_id)
    REFERENCES supplier (supp_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table invoicedetails
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS invoice (
  invoice_id INT NOT NULL AUTO_INCREMENT,
  seller_seller_id INT NOT NULL,
  store_store_id INT NOT NULL,
  invoice_number_invoice VARCHAR(45) NOT NULL,
  create_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (invoice_id),
  INDEX fk_invoice_seller_idx (seller_seller_id ASC) VISIBLE,
  INDEX fk_invoice_store_idx (store_store_id ASC) VISIBLE,
  CONSTRAINT fk_invoice_selle
    FOREIGN KEY ( seller_seller_id)
    REFERENCES seller (seller_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_store_store
    FOREIGN KEY ( store_store_id)
    REFERENCES store (store_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION  
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table invoice
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS invoicedetails (
  invoicedetails_id INT NOT NULL AUTO_INCREMENT,
  invoice_invoice_id INT NOT NULL,
  product_product_id INT NOT NULL,
  clientt_clientt_id INT NOT NULL,
  delete_at TIMESTAMP NULL,
  PRIMARY KEY (invoicedetails_id),
  INDEX fk_invoicedetails_invoice_idx (invoice_invoice_id ASC) VISIBLE,
  INDEX fk_invoice_clientt_idx (clientt_clientt_id ASC) VISIBLE,
  INDEX fk_invoicedetails_product_idx (product_product_id ASC) VISIBLE,
  CONSTRAINT fk_invoicedetails_invoice
    FOREIGN KEY ( invoice_invoice_id)
    REFERENCES invoice (invoice_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_invoice_clientt
    FOREIGN KEY (clientt_clientt_id)
    REFERENCES clientt (clientt_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_invoicedetails_product
    FOREIGN KEY ( product_product_id)
    REFERENCES product (product_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION  
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- INSERTING store
-- -----------------------------------------------------

INSERT INTO store (store_name, store_address)
VALUES ('D1', 'cra 97#56-25');

-- -----------------------------------------------------
-- INSERTING seller
-- -----------------------------------------------------

INSERT INTO seller (seller_name, seller_lastname, create_at)
VALUES ('Julian', 'mazo',CURRENT_TIMESTAMP);

-- -----------------------------------------------------
-- INSERTING documenttype
-- -----------------------------------------------------

INSERT INTO documenttype ( documenttype_type, create_at)
VALUES ('CC',CURRENT_TIMESTAMP);
INSERT INTO documenttype ( documenttype_type, create_at)
VALUES ('NIT',CURRENT_TIMESTAMP);
INSERT INTO documenttype ( documenttype_type, create_at)
VALUES ('TI',CURRENT_TIMESTAMP);

-- -----------------------------------------------------
-- INSERTING clientt
-- -----------------------------------------------------

INSERT INTO clientt ( documenttype_documenttype_id, clientt_number,clientt_name)
VALUES (1,'1017261895','mena');
INSERT INTO clientt ( documenttype_documenttype_id, clientt_number,clientt_name)
VALUES (2,'8909039388','Bancolombia');
INSERT INTO clientt ( documenttype_documenttype_id, clientt_number,clientt_name)
VALUES (3,'1235489713579','pedrito');

-- -----------------------------------------------------
-- INSERTING supplier
-- -----------------------------------------------------

INSERT INTO supplier ( supp_name, supp_phone)
VALUES ("jose antonio",'3003413898');
INSERT INTO supplier ( supp_name, supp_phone)
VALUES ("antonio mazo",'3003413898');
INSERT INTO supplier ( supp_name, supp_phone)
VALUES ("angelica cuervo",'3003413898');
INSERT INTO supplier ( supp_name, supp_phone)
VALUES ("angelica marin",'3003413898');
INSERT INTO supplier ( supp_name, supp_phone)
VALUES ("david rodriguez",'3003413898');
INSERT INTO supplier ( supp_name, supp_phone)
VALUES ("julian mazo",'3003413898');

-- -----------------------------------------------------
-- INSERTING product
-- -----------------------------------------------------

INSERT INTO product ( supp_supp_id, product_name,product_price)
VALUES (1,'carne',5000);
INSERT INTO product ( supp_supp_id, product_name,product_price)
VALUES (1,'quesito',2000);
INSERT INTO product ( supp_supp_id, product_name,product_price)
VALUES (1,'arepas',2500);
INSERT INTO product ( supp_supp_id, product_name,product_price)
VALUES (2,'papa',800);
INSERT INTO product ( supp_supp_id, product_name,product_price)
VALUES (2,'arroz',2000);
INSERT INTO product ( supp_supp_id, product_name,product_price)
VALUES (2,'pastas',2100);
INSERT INTO product ( supp_supp_id, product_name,product_price)
VALUES (3,'frijol',600);
INSERT INTO product ( supp_supp_id, product_name,product_price)
VALUES (3,'lentejas',800);
INSERT INTO product ( supp_supp_id, product_name,product_price)
VALUES (3,'garbanzos',700);
INSERT INTO product ( supp_supp_id, product_name,product_price)
VALUES (4,'salchichas',5000);
INSERT INTO product ( supp_supp_id, product_name,product_price)
VALUES (4,'galletas',2000);
INSERT INTO product ( supp_supp_id, product_name,product_price)
VALUES (4,'tostadas',2500);
INSERT INTO product ( supp_supp_id, product_name,product_price)
VALUES (5,'papas criollas',800);
INSERT INTO product ( supp_supp_id, product_name,product_price)
VALUES (5,'harina',2000);
INSERT INTO product ( supp_supp_id, product_name,product_price)
VALUES (5,'sardina',2100);
INSERT INTO product ( supp_supp_id, product_name,product_price)
VALUES (6,'quineo',600);
INSERT INTO product ( supp_supp_id, product_name,product_price)
VALUES (6,'frijol negro',800);
INSERT INTO product ( supp_supp_id, product_name,product_price)
VALUES (6,'frijol blanco',700);


-- -----------------------------------------------------
-- INSERTING invoice
-- -----------------------------------------------------
INSERT INTO invoice ( seller_seller_id,store_store_id,invoice_number_invoice,create_at)
VALUES (1,1,"789456123",CURRENT_TIMESTAMP);
INSERT INTO invoice ( seller_seller_id,store_store_id,invoice_number_invoice,create_at)
VALUES (1,1,"123456789",CURRENT_TIMESTAMP);
INSERT INTO invoice ( seller_seller_id,store_store_id,invoice_number_invoice,create_at)
VALUES (1,1,"456789123",CURRENT_TIMESTAMP);

-- -----------------------------------------------------
-- Table invoicedetails
-- -----------------------------------------------------
INSERT INTO invoicedetails ( invoice_invoice_id,clientt_clientt_id, product_product_id)
VALUES (1,1,1);
INSERT INTO invoicedetails ( invoice_invoice_id,clientt_clientt_id, product_product_id)
VALUES (1,1,2);
INSERT INTO invoicedetails ( invoice_invoice_id,clientt_clientt_id, product_product_id)
VALUES (1,1,3);
INSERT INTO invoicedetails ( invoice_invoice_id,clientt_clientt_id, product_product_id)
VALUES (1,1,10);
INSERT INTO invoicedetails ( invoice_invoice_id,clientt_clientt_id, product_product_id)
VALUES (1,1,12);
INSERT INTO invoicedetails ( invoice_invoice_id,clientt_clientt_id, product_product_id)
VALUES (2,2,4);
INSERT INTO invoicedetails ( invoice_invoice_id,clientt_clientt_id, product_product_id)
VALUES (2,2,5);
INSERT INTO invoicedetails ( invoice_invoice_id,clientt_clientt_id, product_product_id)
VALUES (2,2,6);
INSERT INTO invoicedetails ( invoice_invoice_id,clientt_clientt_id, product_product_id)
VALUES (2,2,11);
INSERT INTO invoicedetails ( invoice_invoice_id,clientt_clientt_id, product_product_id)
VALUES (2,2,13);
INSERT INTO invoicedetails ( invoice_invoice_id,clientt_clientt_id, product_product_id)
VALUES (3,3,7);
INSERT INTO invoicedetails ( invoice_invoice_id,clientt_clientt_id, product_product_id)
VALUES (3,3,8);
INSERT INTO invoicedetails ( invoice_invoice_id,clientt_clientt_id, product_product_id)
VALUES (3,3,9);
INSERT INTO invoicedetails ( invoice_invoice_id,clientt_clientt_id, product_product_id)
VALUES (3,3,14);
INSERT INTO invoicedetails ( invoice_invoice_id,clientt_clientt_id, product_product_id)
VALUES (3,3,15);
////////////////////
-- -----------------------------------------------------
-- Soft delete
-- -----------------------------------------------------

UPDATE invoicedetails
SET delete_at = NOW()
WHERE invoicedetails_id = 6;

UPDATE invoicedetails
SET delete_at = NOW()
WHERE invoicedetails_id = 3;

-- -----------------------------------------------------
-- Hard delete
-- -----------------------------------------------------
DELETE FROM invoicedetails
WHERE invoicedetails_id = 6;

DELETE FROM invoicedetails
WHERE invoicedetails_id = 5;


-- -----------------------------------------------------
-- disparador para ver el historial de provedores por su id
-- -----------------------------------------------------
delimiter //
create trigger log_Action_supp after update on product
for each row begin
  insert into Action_supp(product,supplier) value (NEW.product_name,NEW.supp_supp_id);
end//
delimiter ;

-- -----------------------------------------------------
-- Update product_name and its supplier
-- -----------------------------------------------------

UPDATE product
SET product_name = 'arepas', supp_supp_id = 4
WHERE product_id = 3;

UPDATE product
SET product_name = 'papa criolla', supp_supp_id = 1
WHERE product_id = 4;

UPDATE product
SET product_name = 'arroz', supp_supp_id = 4
WHERE product_id = 5;















