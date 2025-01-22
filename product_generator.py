import csv
import random

# Generate random data for the Products table
categories = {
    1: "Electronics",
    2: "Clothing",
    3: "Books",
    4: "Groceries",
    5: "Toys",
    6: "Furniture",
    7: "Sports"
}
suppliers = ["Supplier A", "Supplier B", "Supplier C", "Supplier D", "Supplier E"]

# Predefined product names for each category
product_names = {
    1: ["Smartphone", "Laptop", "Headphones", "Smartwatch", "Tablet"],
    2: ["T-Shirt", "Jeans", "Jacket", "Sweater", "Dress"],
    3: ["Novel", "Textbook", "Magazine", "Comics", "Guidebook"],
    4: ["Apple", "Milk", "Bread", "Eggs", "Cheese"],
    5: ["Action Figure", "Puzzle", "Board Game", "Toy Car", "Doll"],
    6: ["Sofa", "Table", "Chair", "Bed", "Cabinet"],
    7: ["Basketball", "Soccer Ball", "Tennis Racket", "Yoga Mat", "Dumbbells"]
}

# Create mapping for CategoryID and SupplierID based on Categories
category_ids = list(categories.keys())
supplier_ids = list(range(1, len(suppliers) + 1))

# Generate random data for the Products table
data = []
product_id = 1
for category_id, names in product_names.items():
    while names:
        product_name = names.pop(0)  # Remove product to avoid duplicates
        supplier_id = random.choice(supplier_ids)
        price = round(random.uniform(5, 500), 2)  # Random price between $5 and $500
        stock_quantity = random.randint(0, 1000)  # Stock quantity between 0 and 1000
        reorder_level = random.randint(10, 100)  # Reorder level between 10 and 100
        data.append([product_id, product_name, category_id, supplier_id, price, stock_quantity, reorder_level])
        product_id += 1

# Write to CSV file
output_file = "/Users/mohamedmoaaz/Desktop/Products.csv"
with open(output_file, mode="w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["ProductID", "ProductName", "CategoryID", "SupplierID", "Price", "StockQuantity", "ReorderLevel"])
    writer.writerows(data)

output_file
