import csv
import random
from datetime import datetime, timedelta

# Generate sample data for the Orders table
orders_data = []
for i in range(1, 101):  # OrderID range from 1 to 100
    order_id = i
    customer_id = random.randint(1, 100)  # CustomerID in range 1 to 100
    order_date = datetime.now() - timedelta(days=random.randint(1, 365))  # Random date within the past year
    total_amount = round(random.uniform(10.0, 500.0), 2)  # Random total amount between 10 and 500
    payment_method = random.choice(['Credit Card', 'PayPal', 'Bank Transfer', 'Cash on Delivery'])
    
    order = {
        "OrderID": order_id,
        "CustomerID": customer_id,
        "OrderDate": order_date.strftime('%Y-%m-%d %H:%M:%S'),  # TIMESTAMP format
        "TotalAmount": total_amount,
        "PaymentMethod": payment_method
    }
    orders_data.append(order)

# Define CSV file name
csv_filename = "orders.csv"

# Create and write to the CSV file
with open(csv_filename, mode="w", newline='') as file:
    writer = csv.DictWriter(file, fieldnames=["OrderID", "CustomerID", "OrderDate", "TotalAmount", "PaymentMethod"])
    
    # Write the header
    writer.writeheader()
    
    # Write the data
    writer.writerows(orders_data)

print(f"CSV file '{csv_filename}' created successfully.")