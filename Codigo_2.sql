-- ----------------------------------------------------------
-- Author julian mazo - jpac.647@gmail.com
-- Version: 0.0.0
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
-- Consult products by name, which must show who has been their supplier.
-- ----------------------------------------------------------------------

SELECT supplier.supp_name, product.product_name
FROM  product
JOIN supplier ON product.supp_supp_id = supplier.supp_id
WHERE product.product_name = 'arepas';








