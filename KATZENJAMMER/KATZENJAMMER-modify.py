

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

#JUST THOSE THREE
try:
    conn = mysql.connector.connect(host = hostName, port = portName, database = username,
                                        user = username, password = password)

    if conn.is_connected():
        print(' Connected to ', hostName)

        cursor = conn.cursor()

        # replace all occurrences of ’bass balalaika’ with ’awesome bass balalaika’,
        # and all occurrences of ’guitar’ with ’acoustic guitar’.

        #print("SKIPPING: 'bass balalaika’ with ’awesome bass balalaika’")

        update_bass_query = "UPDATE Instruments\
                SET Instrument = 'awesome bass balalaika'\
                WHERE Instrument = 'bass balalaika'"
        cursor.execute(update_bass_query)
                

        #print("1")
        ##print("SKIPPING:  'guitar’ with ’acoustic guitar’")
        update_guitar_query = "UPDATE Instruments\
                SET Instrument = 'acoustic guitar'\
                WHERE Instrument = 'guitar'"
        cursor.execute(update_guitar_query)
        
        #print("2")

        #Keep in the instruments table only the information about ’awesome
        # bass balalaika’ players and the information about all instruments
        # Anne-Marit ID = 3
        ##print("SKIPPING: ’awesome bass balalaika’ and  Anne-Marit")

        delete_instruments_query = "DELETE FROM Instrruments\
                    WHERE !(\
                        (Instrument = ’awesome bass balalaika’)\
                        OR (BandmateId = 3);"
        cursor.execute(delete_instruments_query)
        
        
        #print("3")

        #Output the contents of the Instruments table 
        

        #Add a new attribute to the table describing the albums released by 
        # Katzenjammer. The attribute should store the total number of songs
        # on the album.
        num_song_query = "ALTER TABLE Albums \
                    ADD (NumSongs INT);"
        cursor.execute(num_song_query)
        
        print("4")

        #update each record in the albums table to show the correct number of tracks.
        update_num_song_query = "UPDATE Albums SET NumSongs = CASE\
                    WHEN AId = 1 THEN 13\
                    WHEN AId = 2 THEN 12\
                    WHEN AId = 3 THEN 19\
                    WHEN AId = 4 THEN 11\
                    END;"
        cursor.execute(update_num_song_query)

        print("5")

        #Output the contents of the Instruments table 
        cursor.execute("SELECT * FROM Albums ORDER BY Year;")


    else:
        print("Failed to connect")


except Error as e:
    print("Error", e)
    pass