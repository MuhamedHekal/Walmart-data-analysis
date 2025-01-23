import csv
import random

# Generate sample data for the OrderDetails table
order_details_data = []
used_combinations = set()  # Track used (OrderID, ProductID) combinations

for i in range(1, 1001):  # Generate 1000 order details
    order_detail_id = i

    # Generate a unique (OrderID, ProductID) combination
    while True:
        order_id = random.randint(1, 100)  # Random OrderID between 1 and 100
        product_id = random.randint(1, 35)  # ProductID ranges from 1 to 35
        combination = (order_id, product_id)

        # Check if the combination is already used
        if combination not in used_combinations:
            used_combinations.add(combination)
            break

    quantity = random.randint(1, 10)  # Quantity between 1 and 10
    unit_price = round(random.uniform(10.0, 200.0), 2)  # UnitPrice between 10.00 and 200.00
    discount = round(random.uniform(0.0, 0.3), 2)  # Discount between 0% and 30%

    order_detail = {
        "OrderDetailID": order_detail_id,
        "OrderID": order_id,
        "ProductID": product_id,
        "Quantity": quantity,
        "UnitPrice": unit_price,
        "Discount": discount
    }
    order_details_data.append(order_detail)

# Define CSV file name
csv_filename = "order_details.csv"

# Create and write to the CSV file
with open(csv_filename, mode="w", newline='') as file:
    writer = csv.DictWriter(file, fieldnames=["OrderDetailID", "OrderID", "ProductID", "Quantity", "UnitPrice", "Discount"])
    
    # Write the header
    writer.writeheader()
    
    # Write the data
    writer.writerows(order_details_data)

print(f"CSV file '{csv_filename}' created successfully with 1000 rows.")