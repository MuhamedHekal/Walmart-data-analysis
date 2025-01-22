import csv
import random

# Generate random data for the Categories table
data = []
category_names = ["Electronics", "Clothing", "Books", "Groceries", "Toys", "Furniture", "Sports"]
descriptions = [
    "Devices and gadgets",
    "Apparel and accessories",
    "Literature and reading materials",
    "Daily necessities and food items",
    "Children's play items",
    "Home and office furnishings",
    "Sports gear and equipment"
]

for i, category_name in enumerate(category_names, start=1):
    description = descriptions[i - 1]
    data.append([i, category_name, description])

# Write to CSV file
output_file = "/Users/mohamedmoaaz/Desktop/Categories.csv"
with open(output_file, mode="w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["CategoryID", "CategoryName", "Description"])
    writer.writerows(data)

output_file
