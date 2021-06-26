# db-hw3

find_nurse: 
Παρατηρήσεις: Με τον όρο Ψ ασθενείς αναφερόμαστε σε μοναδικούς ασθενείς και όχι σε Ψ ραντεβού.

Ενδεικτική είσοδος: x=4, y=1
Ενδεικτική έξοδος: 
Nurse              | ID         | Number of patients
SADIKU MARY	       | 1053764761	|         19
CHANDLER DANA	   | 1306943949	|         10
RANKIN CHRISTOPHER | 1538480975	|         4
HAYS WENDY	       | 1841630910	|         6

patientreport:
Παρατηρήσεις: Στο SQL ερώτημα το πρώτο UNION είναι για αυτούς που υποβλήθηκαν σε μία θεραπευτική αγωγή ΚΑΙ μείνανε σε κάποιο δωμάτιο.
Το δεύτερο UNION είναι το ίδιο με το πρώτο για τις περισπτώσεις στις οποίες η νοσοκόμα είναι NULL.
Το τρίτο UNION είναι γι' αυτούς που μείνανε σε κάποιο δωμάτιο αλλά δεν υποβλήθηκαν σε κάποια θεραπευτική αγωγή.
Το τέταρτο UNION είναι γι' αυτούς που δεν ανήκουν στις παραπάνω κατηγορίες αλλά υπάρχει εγγραφή στο σύστημα με το όνομά τους.

Ενδεικτική είσοδος: patientName = Spinka Cynthia
Ενδεικτική έξοδος: 
Patient	Physician	Nurse	Date of release	Treatement going on	Cost	Room	Floor	Block
Spinka Cynthia	YURCO STEPHEN	ADAMS KIMBERLY	2010-09-26 17:27:00	PODIATRY	70	7704	7	7
Spinka Cynthia	YOAKAM CHAD	ADAMS KIMBERLY	2010-09-26 17:27:00	PODIATRY	70	7704	7	7

mostcommonsymptoms:
Ενδεικτική είσοδος: MODERNA
Ενδεικτική έξοδος: ['abdominal pain', 'loss appetite', 'lymph node', 'muscle aches', 'shortness breath', 'arm pain', 'fever chills', 'headache chills', 'headache fatigue', 'headache fever', 'lymph nodes', 'swollen lymph', 'arm soreness', 'chills fever', 'dry cough', 'headache myalgia', 'joint pain', 'lasted two', 'pain swelling', 'urgent care', 'aches headache', 'aches nausea', 'allergic reaction', 'arm became', 'arm itchy', 'arm sore', 'arm swollen', 'better today', 'breath cough']

buildnewblock:
Ενδεικτική είσοδος: 4
Ενδεικτική έξοδος: result	ok
