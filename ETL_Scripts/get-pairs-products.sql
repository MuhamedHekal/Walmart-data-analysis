WITH ProductPairs AS (
    SELECT
        p1.ProductId AS Product1,
        p2.ProductId AS Product2,
        p1.CategoryId AS Category,
        COUNT(*) OVER (PARTITION BY p1.CategoryId, p1.ProductId, p2.ProductId) AS PairFrequency
    FROM
        Transaction_fact p1
    JOIN
        Transaction_fact p2
    ON
        p1.ORDERID = p2.orderID
        AND p1.ProductId < p2.ProductId
),
RankedPairs AS (
    SELECT DISTINCT
        Product1,
        Product2,
        Category,
        PairFrequency,
        RANK() OVER (PARTITION BY Category ORDER BY PairFrequency DESC) AS PairRank
    FROM
        ProductPairs
)
SELECT
    cd.CategoryName AS Category_Name,
    pd1.ProductName AS Product1_Name,
    pd2.ProductName AS Product2_Name,
    rp.PairFrequency
FROM
    RankedPairs rp
JOIN
    product_dim pd1
ON
    rp.Product1 = pd1.ProductId
JOIN
    product_dim pd2
ON
    rp.Product2 = pd2.ProductId
JOIN
    category_dim cd
ON
    rp.Category = cd.CategoryId
WHERE
    rp.PairRank = 1;