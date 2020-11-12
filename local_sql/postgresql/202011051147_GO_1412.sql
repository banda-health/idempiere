CREATE OR REPLACE view bh_stocktake_v AS
WITH quantitysums AS (
         SELECT s_1.m_product_id,
            sum(s_1.qtyonhand) AS quantity,
            s_1.ad_client_id,
            s_1.ad_org_id,
            s_1.m_locator_id,
            s_1.m_attributesetinstance_id,
            asi_1.guaranteedate
           FROM m_storage s_1
             LEFT JOIN m_attributesetinstance asi_1 ON s_1.m_attributesetinstance_id = asi_1.m_attributesetinstance_id
          GROUP BY s_1.m_product_id, s_1.ad_client_id, s_1.ad_org_id, s_1.m_locator_id, asi_1.guaranteedate, s_1.m_attributesetinstance_id
        )
 SELECT s.m_product_id,
    l.m_warehouse_id,
    p.name AS product,
    asi.description,
    asi.guaranteedate AS expirationdate,
    l.value AS location,
    s.quantity,
    daysbetween(asi.guaranteedate::timestamp with time zone, 'now'::text::timestamp without time zone::timestamp with time zone) AS shelflifedays,
    s.ad_client_id,
    s.ad_org_id,
    attset.isinstanceattribute,
    attset.created,
    attset.createdby,
    attset.updated,
    attset.updatedby,
    attset.isactive,
    concat(s.m_product_id, l.m_warehouse_id) AS id,
    st.bh_docaction,
    st.processed,
    asi.m_attributeset_id,
    asi.m_attributesetinstance_id
   FROM quantitysums s
     JOIN m_locator l ON s.m_locator_id = l.m_locator_id
     JOIN m_product p ON s.m_product_id = p.m_product_id
     LEFT JOIN m_attributesetinstance asi ON s.m_attributesetinstance_id = asi.m_attributesetinstance_id
     LEFT JOIN m_attributeset attset ON asi.m_attributeset_id = attset.m_attributeset_id
     LEFT JOIN bh_stocktake st ON asi.m_attributesetinstance_id = st.m_attributesetinstance_id
  WHERE attset.name::text = 'BandaHealthProductAttributeSet'::text
  ORDER BY p.name;

SELECT register_migration_script('202011051147_GO_1412.sql') FROM dual;

