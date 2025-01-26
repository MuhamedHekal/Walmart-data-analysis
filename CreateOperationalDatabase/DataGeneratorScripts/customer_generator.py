import csv
import random
from faker import Faker
from datetime import datetime, timedelta

# Initialize Faker
fake = Faker()

# Generate random data for the Customers table
data = []
num_customers = 100
start_date = datetime(2015, 1, 1)
end_date = datetime(2024, 12, 31)

def random_date(start, end):
    """Generate a random datetime between `start` and `end`."""
    delta = end - start
    random_days = random.randint(0, delta.days)
    random_seconds = random.randint(0, 86400)  # seconds in a day
    return start + timedelta(days=random_days, seconds=random_seconds)

for customer_id in range(1, num_customers + 1):
    first_name = fake.first_name()
    last_name = fake.last_name()
    email = f"{first_name.lower()}.{last_name.lower()}@{fake.free_email_domain()}"
    phone = fake.phone_number()
    address = fake.address().replace("\n", ", ")  # Normalize address format
    membership_date = random_date(start_date, end_date).strftime("%Y-%m-%d")
    data.append([customer_id, first_name, last_name, email, phone, address, membership_date])

# Write to CSV file
output_file = "/Users/mohamedmoaaz/Desktop/Customers.csv"
with open(output_file, mode="w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["CustomerID", "FirstName", "LastName", "Email", "Phone", "Address", "MembershipDate"])
    writer.writerows(data)

print(f"CSV file created at: {output_file}")