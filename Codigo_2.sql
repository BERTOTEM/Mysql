-- ----------------------------------------------------------
-- Author julian mazo - jrtma34@gmail.com
-- ----------------------------------------------------------
-- -----------------------------------------------------
-- ----------------------------------------------------------
-- Productos vendidos escribiendo el tipo de documento y el número de documento.
-- ----------------------------------------------------------

SELECT product.product_name,invoice.invoice_number_invoice,clientt.clientt_name,clientt.clientt_number
FROM invoicedetails
JOIN product ON invoicedetails.product_product_id=product.product_id
JOIN invoice ON invoicedetails.invoice_invoice_id = invoice.invoice_id
JOIN clientt ON invoicedetails.clientt_clientt_id = clientt.clientt_id
WHERE clientt.documenttype_documenttype_id =1 AND clientt.clientt_number ='1017261895';
-- ----------------------------------------------------------------------
-- Consultar el provedor actual de un producto
-- ----------------------------------------------------------------------
SELECT supplier.supp_name, product.product_name
FROM  product
inner JOIN supplier ON product.supp_supp_id = supplier.supp_id
WHERE product.product_name = 'arepas';

-- ----------------------------------------------------------------------
-- Historial de provedores antiguos de un producto
-- ----------------------------------------------------------------------
SELECT action_supp.product, supplier.supp_name,action_supp.fecha
FROM  action_supp
inner JOIN supplier ON action_supp.id_Action_supp = supplier.supp_id
WHERE action_supp.product = 'arepas';



