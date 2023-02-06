
LAB 3-1

Grant Baer (grbaer@calpoly.edu)

Special Notes: 

In the CSU Building scripts, CSU Disciplines should be built before Discipline-enrollments. This is because Discipline-enrollments uses a foreign key from Disciplines and thus, Disciplines has to be made first. In the testing files given to us, this was not the case and would lead to the Discipline enrollments not building correctly. 

