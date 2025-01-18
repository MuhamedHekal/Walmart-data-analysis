import pandas as pd
def get_data_frame(cursor, query):
    ''' this function take 
        cursor : database connection cursor
        query : the query to run on this database
        and return the data for the query ad a pandas dataframe
            '''
    # Execute the SQL query
    cursor.execute(query)
    # Fetch all rows from the query result
    data = cursor.fetchall()
    # Get column names (metadata)
    columns = [desc[0] for desc in cursor.description]
    # Convert the data into a pandas DataFrame
    df = pd.DataFrame(data, columns=columns)
    return df

def insert_data_frame(cursor, query, dataFrame):
    ''' this function take 
        cursor : database connection cursor
        query : the query to run on this database
        and insert with commit the data to the databse table
            '''
    for i, row in dataFrame.iterrows():
        cursor.execute(query, tuple(row))
    cursor.execute('commit')