


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
    print("connecting")
    # connect to database
    cnx = mysql.connector.connect(user=username, password=password, port = portName,\
                                  host = hostName, database=username)
    print("connected")

    cursor = cnx.cursor()

    

    #Remove from the flights database all flights except for those to and
    #from AKI (that’s the airport code).
    delete_query = "DELETE FROM Flights WHERE SourceAirport != 'AKI' AND DestAirport != 'AKI';a"
    cursor.execute(delete_query)
        
    #print("delete_query passed")
    #look up the numeric IDs for each airline, and substitute them for
    # airline names in the commands you need to develop.
    update_query = "UPDATE Flights SET FlightNo = FlightNo + 2000 WHERE \
            NOT(Airline = 10 OR Airline = 12 OR Airline = 7);"
    cursor.execute(update_query)
    
    #print("update_query passed")


    #For all flights NOT operated by Continental, AirTran or Virgin,
    #increase the flight number by 2000
    cursor.execute("ALTER TABLE Flights DROP PRIMARY KEY;")
    cursor.execute("UPDATE Flights SET FlightNo = CASE WHEN\
         FlightNo % 2 = 0 THEN FlightNo + 1 WHEN FLightNo % 2 = 1\
         THEN FlightNo - 1 ELSE FlightNo END\
         WHERE  NOT(Airline = 10 OR Airline = 12 OR Airline = 7);")
    cursor.execute("ALTER TABLE Flights ADD PRIMARY KEY (Airline, FlightNo);")

    #print("add_to_query passed")

    #For all pairs of flights to/from AKI NOT operated by Continental,
    #AirTran, or Virgin, you need to flip the flight numbers
        #(In other words, all even-numbered flights need to increase by 1, all
        #odd-numbered flights need to decrease by 1.
    
    ###MOD(N,D) function which returns the remainder of deleting N by D
    mod_query = "UPDATE Flights SET Airline = 7 WHERE\
         NOT(Airline = 10 OR Airline = 12);"
    cursor.execute(mod_query)
    #print("mod_query passed")

    #Replace the airline for all flights to
    #and from AKI except for AirTran 10 and Virgin 12 with Continental 7.

    take_over_query = "UPDATE Flights \
            SET Airline = 7 \
            WHERE (SourceAirport != 'AKI' AND DestAirport != 'AKI') \
                AND (!(Airline = 10 OR Airline = 12));"
    cursor.execute(take_over_query)
    #print("take_over_query passed")

    #Output the contents of the flights table 
    cursor.execute("SELECT * FROM Flights ORDER BY Airline, FlightNo;")


except Error as e:
    print("Error", e)
