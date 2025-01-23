import csv

# Sample data for the Suppliers table with product categories
suppliers_data = [
    {"SupplierID": 1, "SupplierName": "Tech Supplies Co.", "ContactName": "Alice Johnson", "Phone": "123-456-7890", "Email": "alice@techsupplies.com", "Address": "123 Tech Street, Silicon Valley, CA", "ProductCategory": "Electronics"},
    {"SupplierID": 2, "SupplierName": "Fashion Trendz", "ContactName": "Bob Smith", "Phone": "987-654-3210", "Email": "bob@fashiontrendz.com", "Address": "456 Fashion Blvd, Los Angeles, CA", "ProductCategory": "Clothing"},
    {"SupplierID": 3, "SupplierName": "Book Haven", "ContactName": "Carla Green", "Phone": "555-666-7777", "Email": "carla@bookhaven.com", "Address": "789 Read Rd, Chicago, IL", "ProductCategory": "Books"},
    {"SupplierID": 4, "SupplierName": "Fresh Grocer", "ContactName": "David Lee", "Phone": "666-777-8888", "Email": "david@freshgrocer.com", "Address": "101 Fresh St, New York, NY", "ProductCategory": "Groceries"},
    {"SupplierID": 5, "SupplierName": "Toy Land", "ContactName": "Eve White", "Phone": "444-555-6666", "Email": "eve@toyland.com", "Address": "202 Toy St, Dallas, TX", "ProductCategory": "Toys"},
    {"SupplierID": 6, "SupplierName": "Home Comforts", "ContactName": "Frank Black", "Phone": "333-444-5555", "Email": "frank@homecomforts.com", "Address": "303 Comfort Rd, Miami, FL", "ProductCategory": "Furniture"},
    {"SupplierID": 7, "SupplierName": "SportsGear World", "ContactName": "Grace Blue", "Phone": "222-333-4444", "Email": "grace@sportsgear.com", "Address": "404 Sports Ave, Denver, CO", "ProductCategory": "Sports"},
]

# Define CSV file name
csv_filename = "suppliers.csv"

# Create and write to the CSV file
with open(csv_filename, mode="w", newline='') as file:
    writer = csv.DictWriter(file, fieldnames=["SupplierID", "SupplierName", "ContactName", "Phone", "Email", "Address", "ProductCategory"])
    
    # Write the header
    writer.writeheader()
    
    # Write the data
    writer.writerows(suppliers_data)

print(f"CSV file '{csv_filename}' created successfully.")