# ----- CONFIGURE YOUR EDITOR TO USE 4 SPACES PER TAB ----- #
import settings
import sys,os
sys.path.append(os.path.join(os.path.split(os.path.abspath(__file__))[0], 'lib'))
import pymysql as db

import random

def connection():
    ''' User this function to create your connections '''
    con = db.connect(
        settings.mysql_host, 
        settings.mysql_user, 
        settings.mysql_passwd, 
        settings.mysql_schema)
    
    return con

# Helping Function
def create_ngrams(text, num):
    temp = text.split()
    
    stopwards = [
        'i', 'me', 'my', 'myself', 'we', 'our', 'ours', 'ourselves', 
        'you', 'your', 'yours', 'yourself', 'yourselves', 'he', 'him', 
        'his', 'himself', 'she', 'her', 'hers', 'herself', 'it', 'its',
        'itself', 'they', 'them', 'their', 'theirs', 'themselves', 'what',
        'which', 'who', 'whom', 'this', 'that', 'these', 'those', 'am', 
        'is', 'are', 'was', 'were', 'be', 'been', 'being', 'have', 
        'has', 'had', 'HAVING', 'do', 'does', 'did', 'doing', 'a', 'an',
        'the', 'and', 'but', 'if', 'or', 'because', 'as', 'until', 
        'while', 'of', 'at', 'by', 'for', 'with', 'about', 'against',
        'between', 'into', 'through', 'during', 'before', 'after', 'above',
        'below', 'to', 'FROM', 'up', 'down', 'in', 'out', 'on', 'off',
        'over', 'under', 'again', 'further', 'then', 'once', 'here', 
        'there', 'when', 'WHERE', 'why', 'how', 'all', 'any', 'both',
        'each', 'few', 'more', 'most', 'other', 'some', 'such', 'no',
        'nor', 'not', 'only', 'own', 'same', 'so', 'than', 'too', 
        'very', 's', 't', 'can', 'will', 'just', 'don', 'should','now', 
        'also', 'patient', 'injection', 'took', 'left', 'hours', 'vaccine', 
        'went', 'day', 'severe', 'body', 'felt', 'covid-', 'received', 'site', 
        'dose', 'right', 'started', 'first', 'feeling', 'unspecified', 'within', 
        'around', 'days', 'covid', 'developed', 'back', 'morning', 'mg', 
        'minutes', 'woke', 'got', 'hospital', 'next', 'prior', 'pt', 'red', 
        'symptoms', 'area', 'night', 'emergency', 'history', 'medical', 
        'medications', 'post', 'report', 'began', 'possible', 'administered', 
        'approximately', 'away', 'bnt', 'bp', 'event', 'get', 'given',
        'hr', 'information', 'later', 'number', 'outcome', 'resolved',
        'pfizer', 'side', 'pm', 'benadryl', 'er', 'ed'
    ]

    # Clearing the list FROM stopwards
    for sw in stopwards:
        try:
            while True:
                temp.remove(sw)
        except ValueError:
            pass

    # Returning n-gram, based on num
    if num == 1:
        return temp
    else:
        final = []
        for i in range(0, len(temp)-num+1):
            string = ''
            for j in range(0, num):
                if j != 0:
                    string += ' '
                string += temp[i+j]
            final.append(string)
        return final


def mostcommonsymptoms(vax_name):
    # Create a new connection
    con=connection()
    # Create a cursor on the connection
    cur=con.cursor()

    # SQL query to get the symptoms
    cur.execute("SELECT symptoms FROM vaccination WHERE vaccines_vax_name = '%s'" %vax_name)
    data = cur.fetchall()

    # If vax_name doesn't exist
    if len(data) == 0:
        return [(vax_name, "Not Found")]

    punctuation = ['?', ',', '.', '!', ':', ';', '/', '-', '(', ')', '[', ']', '{', '}',
                    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', ' ? ',
                    ',', '.', '!', ':', ';', '/', '-', '(',')', '[', ']',
                    '{', '}', '%', '&', '@']

    data_str = []
    final = []

    # Getting data into lowercase and without punctuation
    # Also, ngrams created
    for i in range(len(data)):
        data_str.append(data[i][0].lower())

        for p in punctuation:
            data_str[i] = data_str[i].replace(p, '')
        
        final += create_ngrams(data_str[i], 2)


    # Sorting final_list and creating dictionary
    # with, keys=term and values=times_seen
    final.sort()
    vax = {}
    n = 1
    temp = final[0]
    for i in range(1, len(final)):
        if temp != final[i]:
            vax[temp] = n
            temp = final[i]
            n = 0
        else:
            n += 1


    # Creating output_list
    sort_vax = sorted(vax.items(), key=lambda x: x[1], reverse=True)
    output = []
    for i in range(30):
        output.append(sort_vax[i][0])

    # Closing connection
    con.close()
    return [(vax_name, output)]


def buildnewblock(blockfloor):

   # Create a new connection
    con=connection()
    
    # Create a cursor on the connection
    cur=con.cursor()

    # Get all reserved BlockCodes
    sql = "SELECT BlockCode FROM block WHERE BlockFloor = '%d' ORDER BY BlockCode;" % int(blockfloor)
    cur.execute(sql)
    blockcodes = cur.fetchall()

    # blockfloor not existing
    if len(blockcodes) == 0:
        return [("result", "error")]

    # No more than 9 blockcodes in a blockfloor
    if len(blockcodes) == 9:
        return [("result", "error")]

    available_blockcodes = list(range(1, 10))

    # remove reserved blockcodes FROM list with available blockcodes
    for x in blockcodes:
        if x[0] in available_blockcodes:
            available_blockcodes.remove(x[0])

    blockcode = available_blockcodes[0]
    rooms = random.randint(1, 5)

    # Insert into block table
    cur.execute("INSERT INTO block(`BlockFloor`, `BlockCode`) VALUES ('%d', '%d');" % (int(blockfloor), int(blockcode)))

    # Insert into room table
    for roomnumber in range(0, rooms):
        cur.execute("INSERT INTO room(`RoomNumber`, `RoomType`, `BlockFloor`, `BlockCode`, `Unavailable`) VALUES ('%s', 'single', '%d', '%d', '0');" % (str(blockfloor) + str(blockcode) + "{0:0=2d}".format(roomnumber), int(blockfloor), int(blockcode)))

    try:
        con.commit()
    except:
        con.rollback()

    con.close()
    return [("result","ok")]

def findnurse(x,y):

    # Create a new connection
    con=connection()
    
    # Create a cursor on the connection
    cur=con.cursor()

    sql = "SELECT BlockCode FROM block WHERE BlockFloor = '%d';" % (int(x))
    cur.execute(sql)    #check which floors exist
    results=cur.fetchall()
    
    if not len(results):
        return [("Input is not valid",),]

    sql = """SELECT n.Name, n.EmployeeID, COUNT(DISTINCT v.patient_SSN) AS number_of_patients
            FROM nurse n, vaccination v
            WHERE NOT EXISTS(
                SELECT b.BlockCode
                FROM block b
                WHERE b.BlockFloor='%d' AND NOT EXISTS(
                    SELECT *
                    FROM on_call o
                    WHERE o.BlockFloor='%d'  AND  n.EmployeeID= o.Nurse  AND  o.BlockCode=b.BlockCode 
                )
            )
            AND exists(
                SELECT*
                FROM appointment a
                WHERE n.EmployeeID = a.PrepNurse
                GROUP BY  a.PrepNurse
                HAVING COUNT(a.Patient)>='%d'
            )
            AND (v.nurse_EmployeeID=n.EmployeeID)
            GROUP BY v.nurse_EmployeeID;
        """ % (int(x), int(x), int(y))
        
    cur.execute(sql)
    results = cur.fetchall()
    con.close()

    l=list()
    l.append(("Nurse", "ID", "Number of patients"))
    for row in results:
        l.append(row)   #εισάγω τις υπόλοιπες tuples
    
    return l


def patientreport(patientName):
    # Create a new connection
    con=connection()

    # Create a cursor on the connection
    cur=con.cursor()

    sql= """
    SELECT pt.Name, p.Name, n.Name, s.StayEnd, t.Name, t.Cost, r.RoomNumber, r.BlockFloor, r.BlockCode
    FROM patient pt,undergoes u, treatment t,physician p,nurse n, stay s, room r
    WHERE (pt.SSN= u.Patient) AND (u.AssistingNurse=n.EmployeeID) AND (u.Physician= p.EmployeeID) AND (t.Code= u.Treatment) AND (s.StayID=u.Stay) AND (s.Room= r.RoomNumber) AND(pt.SSN=s.Patient) AND pt.Name="%s"
    UNION
    SELECT pt.Name, p.Name, "", s.StayEnd, t.Name, t.Cost, r.RoomNumber, r.BlockFloor, r.BlockCode
    FROM patient pt,undergoes u, treatment t,physician p,stay s, room r
    WHERE (pt.SSN= u.Patient) AND (u.AssistingNurse IS NULL) AND (u.Physician= p.EmployeeID) AND (t.Code= u.Treatment) AND (s.StayID=u.Stay) AND (s.Room= r.RoomNumber) AND(pt.SSN=s.Patient) AND pt.Name="%s"
    UNION
    SELECT pt.Name, "", "", StayEnd, "", "", r.RoomNumber, r.BlockFloor, r.BlockCode
    FROM patient pt, stay s, room r
    WHERE (pt.SSN=s.Patient) AND (r.RoomNumber = s.Room) AND pt.Name= "%s" AND pt.SSN NOT IN(
        SELECT u.Patient
        FROM undergoes u
    )
    UNION
    SELECT pt.Name, "", "", "", "", "", "", "", ""
    FROM patient pt
    WHERE pt.Name="%s" and pt.SSN NOT IN(
        SELECT u.Patient
        FROM undergoes u
        UNION
        SELECT s.Patient
        FROM stay s
    );
    """ %(patientName,patientName,patientName,patientName)

    cur.execute(sql)
    results = cur.fetchall()
    con.close()

    x=list()    #οριζω λιστα, ώστε να επιστραφεί μια λίστα με tuples
    x.append(("Patient", "Physician", "Nurse", "Date of release", "Treatement going on", "Cost", "Room", "Floor", "Block")) #εισάγω την κεφαλιδα με τα ονοματα τον πεδιων

    if len(results) == 0:
        x.append(("-", "-", "-", "-", "-", "-", "-", "-", "-"))
    else:
        for row in results:
            x.append(row)   #εισάγω τις υπόλοιπες tuples
        
    return x
