import mysql.connector


def get_db_connection():
   connection = mysql.connector.connect(
       host="localhost",       
       user="root",            
       password="123456789",   
       database="PersonioHR"   
   )
   return connection


# LISTING TABLES
def list_tables(connection):
   cursor = connection.cursor()
   listing_query = "SHOW TABLES"
   cursor.execute(listing_query)
   all_tables = cursor.fetchall()


   print("\nList of all tables present in the Database - PersonioHR: \n")
   for index, all_tables_loop in enumerate(all_tables, start=1):
       print(f"{index}. {all_tables_loop[0]}")
   return [table[0] for table in all_tables]


# READING DATA
def read_data(connection, table_name):
   cursor = connection.cursor()
   select_query = f"SELECT * FROM {table_name}"
   cursor.execute(select_query)
   rows = cursor.fetchall()


   print(f"\nData from {table_name} table:")
   for row in rows:
       print(row)




# INSERTING DATA
def insert_data(connection, table_name):
   cursor = connection.cursor()
   cursor.execute(f"DESCRIBE {table_name}")
   columns = cursor.fetchall()
   column_names = [column[0] for column in columns]
  
   print(f"\nInserting data into {table_name}.")
   data = {}
   for column_name in column_names:
       value = input(f"Enter value for {column_name}: ")
       data[column_name] = value


   columns_string = ", ".join(column_names)
   placeholders = ", ".join(["%s"] * len(column_names))
   insert_query = f"INSERT INTO {table_name} ({columns_string}) VALUES ({placeholders})"
  
   try:
       cursor.execute(insert_query, tuple(data.values()))
       connection.commit()
       print("Data inserted successfully.")
   except mysql.connector.Error as e:
       print("Failed to insert data:", e)


# DELETING DATA
def delete_data(connection, table_name):
   cursor = connection.cursor()
  
   print(f"\nDeleting data from {table_name}.")
   condition_column = input("Enter the column name to use as a condition for deletion: ")
   condition_value = input(f"Enter the value of {condition_column} to match records to delete: ")


   delete_query = f"DELETE FROM {table_name} WHERE {condition_column} = %s"
  
   try:
       cursor.execute(delete_query, (condition_value,))
       connection.commit()
       print("Data deleted successfully.")
   except mysql.connector.Error as e:
       print("Failed to delete data:", e)


# UPDATING DATA
def update_data(connection, table_name):
   cursor = connection.cursor()
  
   cursor.execute(f"DESCRIBE {table_name}")
   columns = cursor.fetchall()
   column_names = [column[0] for column in columns]
  
   print(f"\nUpdating data in {table_name}.")
   condition_column = input("Enter the column name to use as a condition for updating: ")
   condition_value = input(f"Enter the value of {condition_column} to match records to update: ")


   data = {}
   for column_name in column_names:
       if column_name != condition_column:
           value = input(f"Enter new value for {column_name} (leave blank to skip): ")
           if value:
               data[column_name] = value


   set_clause = ", ".join([f"{col} = %s" for col in data.keys()])
   update_query = f"UPDATE {table_name} SET {set_clause} WHERE {condition_column} = %s"
  
   try:
       cursor.execute(update_query, tuple(data.values()) + (condition_value,))
       connection.commit()
       print("Data updated successfully.")
   except mysql.connector.Error as e:
       print("Failed to update data:", e)


# CRUD OPERATIONS
def crud_operations(connection):
   print("\nPlease Select Which Table you'd like to modify:\n")
   tables = list_tables(connection)
   tables_choice = input("\nEnter the Table number: ")


   try:
       selected_table = tables[int(tables_choice) - 1]
       print(f"\nYou selected: {selected_table}")
   except (IndexError, ValueError):
       print("Invalid choice, please enter a valid table number.")
       return


   while True:
       print("\nWhat would you like to perform?\n")
       print("1. Read Data")
       print("2. Insert Data")
       print("3. Update Data")
       print("4. Delete Data")
       print("5. Exit")


       perform_choice = input("Select the number for CRUD operations: ")
       if perform_choice == '1':
           read_data(connection, selected_table)
       elif perform_choice == '2':
           insert_data(connection, selected_table)
           pass
       elif perform_choice == '3':
           update_data(connection, selected_table)
           pass
       elif perform_choice == '4':
           delete_data(connection, selected_table)
           pass
       elif perform_choice == '5':
           print("Exiting CRUD operations")
           break
       else:
           print("Enter a valid number")


#AVERAGE OPERATION
def average_operation(connection, table_name):
   cursor = connection.cursor()
  
   cursor.execute(f"DESCRIBE {table_name}")
   columns = cursor.fetchall()
   numeric_columns = [column[0] for column in columns if column[1].startswith(('int', 'float', 'double', 'decimal'))]
  
   if not numeric_columns:
       print(f"No numeric columns found in {table_name}.")
       return
  
   print("\nSelect a numeric column to calculate the average:")
   for index, col in enumerate(numeric_columns, start=1):
       print(f"{index}. {col}")


   column_choice = int(input("Enter the column number: ")) - 1
   selected_column = numeric_columns[column_choice]


   avg_query = f"SELECT AVG({selected_column}) FROM {table_name}"
  
   try:
       cursor.execute(avg_query)
       average = cursor.fetchone()[0]
       print(f"The average of {selected_column} in {table_name} is: {average}")
   except mysql.connector.Error as e:
       print("Failed to calculate average:", e)


#SUM OPERATION
def sum_operation(connection, table_name):
   cursor = connection.cursor()
  
   cursor.execute(f"DESCRIBE {table_name}")
   columns = cursor.fetchall()
   numeric_columns = [column[0] for column in columns if column[1].startswith(('int', 'float', 'double', 'decimal'))]
  
   if not numeric_columns:
       print(f"No numeric columns found in {table_name}.")
       return
  
   print("\nSelect a numeric column to calculate the sum:")
   for index, col in enumerate(numeric_columns, start=1):
       print(f"{index}. {col}")


   column_choice = int(input("Enter the column number: ")) - 1
   selected_column = numeric_columns[column_choice]


   avg_query = f"SELECT SUM({selected_column}) FROM {table_name}"
  
   try:
       cursor.execute(avg_query)
       average = cursor.fetchone()[0]
       print(f"The sum of {selected_column} in {table_name} is: {average}")
   except mysql.connector.Error as e:
       print("Failed to calculate sum:", e)


# ARITHMETIC OPERATIONS
def aritmethic_operations(connection):
   print("\nPlease Select Which Table you'd like to modify:\n")
   tables = list_tables(connection)
   tables_choice = input("\nEnter the Table number: ")


   try:
       selected_table = tables[int(tables_choice) - 1]
       print(f"\nYou selected: {selected_table}")
   except (IndexError, ValueError):
       print("Invalid choice, please enter a valid table number.")
       return


   while True:
       print("\nWhich arithmetic operations would you like to perform?\n")
       print("1. Average")
       print("2. Sum")
       print("3. Exit")


       perform_choice = input("Select the number for CRUD operations: ")
       if perform_choice == '1':
           average_operation(connection, selected_table)
       elif perform_choice == '2':
           sum_operation(connection, selected_table)
           pass
       elif perform_choice == '3':
           print("Exiting CRUD operations")
           break
       else:
           print("Enter a valid number")




# MAIN
def main():
   connection = get_db_connection() 
   print("\n\n\nWELCOME to PersonioHR DATABASE!\n\n")
   print("\nYou are now acting as an admin! Which company would you like to access?\n")

   while True:
       print("\n\nWhat would you like to perfrom today?\n\n")
       print("\033[92m1. List all Tables in PersonioHR Database\033[0m")
       print("\033[94m2. Perform CRUD Operations\033[0m")
       print("\033[96m3. Perform Airthmetic Operations\033[0m")
       print("\033[91m4. Exit\033[0m")


       choice = input("Enter your input: ")
       if choice == '1':
          list_tables(connection)
       if choice == '2':
           crud_operations(connection)
       elif choice == '3':
           aritmethic_operations(connection)
       elif choice == '4':
           print("Exiting program")
           break
       else:
           print("\nEnter Valid Choice\n")

   if connection.is_connected():
       connection.close()
       print("Connection to MySQL database closed")


try:
   if __name__ == "__main__":
       main()
except mysql.connector.Error as e:
   print("Error occurred, the error is:", e)
finally:
   if 'connection' in locals() and connection.is_connected():
       connection.close()
       print("Connection to MySQL database closed")
