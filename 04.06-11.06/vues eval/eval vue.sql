CREATE VIEW v_product_catalog
AS
SELECT pro_id, pro_ref, pro_name, cat_id, cat_name
from products
join categories on cat_id = pro_cat_id