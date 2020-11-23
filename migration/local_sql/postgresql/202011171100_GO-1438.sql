CREATE OR REPLACE VIEW bh_c_order_v AS
WITH payments AS (
         SELECT COALESCE(sum(p_1.payamt), 0::numeric) AS paytotal,
            p_1.bh_c_order_id AS c_order_id
           FROM c_payment p_1
          GROUP BY p_1.bh_c_order_id
        )
 SELECT c.c_order_id,
    c.c_bpartner_id,
    COALESCE(c.grandtotal, 0::numeric) AS grandtotal,
    COALESCE(p.paytotal, 0::numeric) AS paytotal,
    COALESCE(c.grandtotal, 0::numeric) - COALESCE(p.paytotal, 0::numeric) AS amtleft
   FROM c_order c
     LEFT JOIN payments p ON c.c_order_id = p.c_order_id;

SELECT register_migration_script('202011171100_GO_1438.sql') FROM dual;
