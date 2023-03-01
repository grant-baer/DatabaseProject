

#GRANT BAER
#grbaer@calpoly.edu


import mysql.connector
from mysql.connector import Error



portName = "3306"
hostName = "mysql.LabThreeSixFive.com"

# read login credentials from file
with open("account.info", 'r') as file:
    username = file.readline().strip()
    password = file.readline().strip()


try:
    conn = mysql.connector.connect(host = hostName, port = portName, database = username,
                                        user = username, password = password)

    if conn.is_connected():
        print('Connected to ', hostName)

        cursor = conn.cursor()

        cursor.execute("ALTER TABLE Items Drop FOREIGN KEY fkey;")
        cursor.execute("ALTER TABLE Items ADD CONSTRAINT fkey\
                FOREIGN KEY (Item) REFERENCES Goods(Id) ON DELETE CASCADE;")
                

        #Remove from the table containing the listing of the pastries,
        #  information about all pastries that are cheaper than $5.
        delete_pastries_query = "DELETE FROM Goods\
                WHERE (Price < 5.00);"
        cursor.execute(delete_pastries_query)
        
        #Increase the prices of the chocolate-flavored items by 20%.
        increase_chocolate_query = "UPDATE Goods \
                SET Price = (Price*1.2)\
                WHERE (Flavor = 'Chocolate');"
        cursor.execute(increase_chocolate_query)

        #Reduce the prices of Lemon-flavored items by $2.
        decrease_lemon_query = "UPDATE Goods \
                SET Price = (Price - 2.00)\
                WHERE (Flavor = 'Lemon');"
        cursor.execute(decrease_lemon_query)

        #Reduce the price of all other cakes by 10%.
        decrease_cake_query = "UPDATE Goods \
                SET Price = (Price*.9)\
                WHERE (Flavor != 'Lemon') AND (Food = 'Cake');"
        cursor.execute(decrease_cake_query)

        #Make the price of pie items equal to the price of the least expensive 
        # cake (for this question you can look up what that number is.)
        change_pie_query = "UPDATE Goods \
                SET Price = 8.95\
                WHERE (Food = 'Pie');"
        cursor.execute(change_pie_query)


        #Output the contents of the Goods table 
        cursor.execute("SELECT * FROM Goods ORDER BY Id;")



    else:
        print("Failed to connect")


except Error as e:
    print("Error", e)
    pass