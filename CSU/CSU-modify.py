

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
        print(' Connected to ', hostName)

        cursor = conn.cursor(buffered=True)
        print("0")
        # Keep in the table documenting campus enrollments by discipline only
        # the information about the following enrollments:
            # • Engineering majors (9) from Cal Poly San Luis Obispo, Cal Poly
            # Pomona, and Humboldt State University. 20, 14, 8
            # • San Jose State enrollements for disciplines with more than 500
            # graduate students. 19
            # • All enrollments in LA County CSUs (look up which ones are in
            # LA County) where graduate enrollment exceeds undergraduate
            # enrollment for the same discipline.  4, 9, 10, 13, 14
        enrollment_update_query = "DELETE FROM DisciplineEnrollments\
                        WHERE !((((Campus = 20) OR (Campus = 14) OR (Campus = 8)) AND (Discipline = 9))\
                        OR ((Campus = 19) AND (Graduate > 500))\
                        OR ((Campus = 4) OR (Campus = 9) OR (Campus = 10) OR (Campus = 13) OR (Campus = 14))\
                        );"
        cursor.execute(enrollment_update_query)

        #Output the contents of the DisciplineEnrollments table 
        cursor.execute("SELECT * FROM DisciplineEnrollments ORDER BY Campus, Discipline;")
        
        print("1")

        
        

        #  Keep in the table documenting CSU fees only the information that
        # matches ALL the conditions below:
            # • The fee is greater than $2.500;
            # • The year is either 2002 or one of 2004—2006.
            # • The campus is either Cal Poly San Luis Obispo, Cal Poly Pomona
            # or San Diego State
        fees_update_query = "DELETE FROM CSUFees\
                WHERE !(\
                    (CampusFee > 2500)\
                    AND ((Year = 2002) OR (Year = 2004) OR (Year = 2005) OR (Year = 2006)) \
                    AND ((Campus = 14) OR (Campus = 20) OR (Campus = 17))\
                    );"
        cursor.execute(fees_update_query)
        
        print("2")
        
        #Output the contents of the DisciplineEnrollments table 
        cursor.execute("SELECT * FROM CSUFees ORDER BY Campus, Year;")



    else:
        print("Failed to connect")



except Error as e:
    print("Error", e)
    pass