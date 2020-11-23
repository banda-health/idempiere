CREATE OR REPLACE VIEW bh_c_order_payment_v AS
WITH orderpayment AS (
         SELECT ordr.c_order_id,
            invc.c_invoice_id,
            pmt_1.c_payment_id
           FROM c_order ordr
             JOIN c_invoice invc ON ordr.c_order_id = invc.c_order_id
             JOIN c_payment pmt_1 ON pmt_1.c_invoice_id = invc.c_invoice_id
        UNION
         SELECT ordr.c_order_id,
            NULL::numeric AS c_invoice_id,
            pmt_1.c_payment_id
           FROM c_order ordr
             JOIN c_payment pmt_1 ON pmt_1.bh_c_order_id = ordr.c_order_id
          WHERE pmt_1.c_invoice_id IS NULL
        )
 SELECT opmt.c_order_id,
    opmt.c_invoice_id,
    opmt.c_payment_id
   FROM orderpayment opmt
     JOIN c_payment pmt ON opmt.c_payment_id = pmt.c_payment_id
     LEFT JOIN c_payment reverse ON pmt.c_payment_id = reverse.reversal_id
  WHERE pmt.reversal_id IS NULL AND pmt.docstatus <> 'RE'::bpchar AND reverse.c_payment_id IS NULL;

SELECT register_migration_script('202011171100_GO_1439.sql') FROM dual;
