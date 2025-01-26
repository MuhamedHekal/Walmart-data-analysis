# Walmart Data Analysis Project

This repository contains a comprehensive analysis of Walmart's sales data, focusing on data warehousing, ETL processes, and analytical queries to derive business insights.

## Repository Structure

```
Walmart-data-analysis/
├── CreateOperationalDatabase/  # SQL scripts to create the operational database
├── ETL_Scripts/                # Python scripts for Extract, Transform, Load processes
├── Queries/                    # SQL queries for data analysis
├── walmart_star_schema/        # Schema design for the data warehouse
├── Walmart Data Analysis.pdf   # Project report detailing the analysis
├── .gitignore                  # Git ignore file
└── README.md                   # Project documentation
```

## Project Overview

The project involves:

- **Operational Database Creation**: Setting up the initial database structure to store Walmart's transactional data.
- **ETL Processes**: Extracting data from the operational database, transforming it for analysis, and loading it into a data warehouse.
- **Star Schema Design**: Developing a star schema to optimize query performance for analytical purposes.
- **Analytical Queries**: Executing SQL queries to extract meaningful insights from the data warehouse.

## Getting Started

To explore or replicate this analysis:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/MuhamedHekal/Walmart-data-analysis.git
   cd Walmart-data-analysis
   ```

2. **Set Up the Operational Database**:
   - Navigate to the `CreateOperationalDatabase/` directory.
   - Execute the SQL scripts to create the necessary tables and populate them with data.

3. **Review the Star Schema**:
   - The `walmart_star_schema/` directory contains the schema design for the data warehouse.

4. **Run ETL Processes**:
   - Navigate to the `ETL_Scripts/` directory.
   - Execute the Python scripts to perform data extraction, transformation, and loading into the data warehouse.


5. **Perform Data Analysis**:
   - Navigate to the `Queries/` directory.
   - Execute the SQL queries to generate analytical reports and insights.

## Project Report

For a detailed explanation of the project's objectives, methodologies, and findings, refer to the [Walmart Data Analysis.pdf](Walmart%20Data%20Analysis.pdf) file in the root directory.

## Tools and Technologies

- **Database**: SQL-based relational database management systems.
- **ETL**: Python scripts for data processing.
- **Schema Design**: Star schema for efficient data retrieval.
- **Analysis**: SQL queries for data analysis.
- **Python**: Creating ELT Scripts.

## Contributing

Contributions are welcome! If you have suggestions or improvements, feel free to open an issue or submit a pull request.

