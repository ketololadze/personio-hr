import mysql.connector

# Connect to the MySQL database
def get_db_connection():
    connection = mysql.connector.connect(
        host="localhost",        # MySQL server host
        user="root",             # Your MySQL username
        password="123456789", # Your MySQL password
        database="test_db"  # Replace with your database name
    )
    return connection

    print("The script is running successfully!")
