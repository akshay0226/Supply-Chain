USE supply;

-- 1. Inventory Management

-- Goal: Show current inventory levels and trends.
-- Current inventory levels by product and warehouse

SELECT 
    ProductID,
    WarehouseID,
    SUM(InventoryLevels) AS CurrentInventory
FROM inventory
GROUP BY ProductID, WarehouseID;

-- Inventory trends over time

SELECT 
    Date,
    ProductID,
    SUM(Inventorylevels) AS InventoryTrend
FROM inventory
GROUP BY Date, ProductID
ORDER BY Date;

-- 2. Order Fulfillment

-- Goal: Track fulfillment and on-time delivery.
-- Order fulfillment status over time

SELECT 
    Date,
    FulfillmentStatus,
    COUNT(OrderID) AS OrdersCount
FROM order_fulfillment
GROUP BY Date, FulfillmentStatus;

-- On-time delivery rate by product

SELECT 
    ProductID,
    ROUND(SUM(CASE WHEN OnTimeDelivery = 'Yes' THEN 1 ELSE 0 END) * 1.0 / COUNT(OrderID), 4) AS OnTimeDeliveryRate
FROM order_fulfillment
GROUP BY ProductID;

-- 3. Supplier Performance

-- Goal: Assess delivery speed and defect rates.
-- Average delivery time by supplier

SELECT 
    SupplierID,
    AVG(DeliveryTime) AS AvgDeliveryTime
FROM supplier_performance
GROUP BY SupplierID;

-- Defect rate over time

SELECT 
    Date,
    ROUND(AVG("Defect rates") * 100.0, 2) AS DefectRatePercentage
FROM supplier_performance
GROUP BY Date
ORDER BY Date;

-- 4. Transportation Efficiency

-- Goal: Evaluate transit time and carrier reliability.
-- Transit time by carrier and delivery status

SELECT 
    Carriers,
    DeliveryStatus,
    AVG(TransitTime) AS AvgTransitTime
FROM transport
GROUP BY Carriers, DeliveryStatus;

-- Delivery status over time

SELECT 
    Date,
    DeliveryStatus,
    COUNT(*) AS Count
FROM transport
GROUP BY Date, DeliveryStatus;

-- 5. Supply Chain Costs

-- Goal: Track total and category-specific costs.
-- Cost distribution by type

SELECT 
    CostType,
    SUM(Amount) AS TotalAmount
FROM supply_chain_cost
GROUP BY CostType;

-- Cost trends over time

SELECT 
    Date,
    SUM(Amount) AS DailyTotalCost
FROM supply_chain_cost
GROUP BY Date
ORDER BY Date;














