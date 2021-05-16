# 1
select p.SSN, p.Name, count(*) as totalStays, sum(t.Cost) as totalCost
from undergoes u, treatment t, patient p
where u.Treatment = t.Code and u.patient = p.SSN and u.Patient in (
	select p.SSN
	from stay s, patient p
	where s.Patient = p.SSN and p.Age >= 30 and p.Age <= 40 and p.Gender = 'male'
	group by s.Patient
	having count(*) > 1
)
group by p.SSN;

# 2
select n.EmployeeID, n.Name
from nurse n
where n.EmployeeID in (
	select o.Nurse
	from on_call o
	where o.OnCallStart >= '2008-04-20 23:22:00' and o.onCallEnd <= '2009-06-04 11:00:00' and o.BlockFloor >= 4 and o.BlockFloor <= 7
	group by o.Nurse
	having count(*) > 1
);

# 3
select p.SSN, p.Name
from patient p, vaccination v
where p.SSN = v.patient_SSN and p.Gender = 'female' and p.Age > 40
group by p.SSN
having count(*) in (
	select u.num_of_doses
    from vaccines u, vaccination v
    where u.vax_name = v.vaccines_vax_name
);

# 4
select m.Name, m.Brand, count(*) as Patients
from medication m, prescribes p
where m.Code = p.Medication
group by p.Medication
having count(*) > 1;

# 5
select p.SSN as patient_SSN
from patient p
where SSN in (
	select v.patient_SSN
    from vaccination v
    where not exists (
		select *
        from vaccination b
        where b.patient_SSN = v.patient_SSN and v.physician_EmployeeID <> b.physician_EmployeeID
	)
);

# 6
select 'yes' as answer
from room r
where not exists (
	select *
    from stay s
    where s.StayStart >= '2013-01-01 00:00:00' and s.StayEnd <= '2013-12-31 23:59:59' and s.Room = r.RoomNumber
)
union
select 'no' as Answer
from room r
where not exists (
	select *
    from stay s
    where (s.StayStart < '2013-01-01 00:00:00' or s.StayEnd > '2013-12-31 23:59:59') and s.Room = r.RoomNumber
);

# 7
select p.EmployeeID, p.Name, count(*) as numOfpatient
from physician p, undergoes u
where p.Position = 'PATHOLOGY' and p.EmployeeID = u.Physician
group by p.EmployeeID, p.Name
union
select p.EmployeeID, p.Name, 0 as numOfpatient
from physician p
where p.Position = 'PATHOLOGY' and not exists (
	select *
    from undergoes u
    where u.Physician = p.EmployeeID
);

# 8
select p.Name
from patient p, vaccination v
where p.SSN = v.patient_SSN
group by p.SSN
having count(*) < 2
union
select p.Name
from patient p
where not exists (
	select *
    from vaccination v
    where p.SSN = v.patient_SSN
)
group by p.SSN;

# 9
select vaccines_vax_name
from vaccination
group by vaccines_vax_name
having count(*) = (
	select max(num) 
	from (
		select vaccines_vax_name, count(*) as Num
        from vaccination
        group by vaccines_vax_name
	) as K
);

# 10
select p.Name
from trained_in t, treatment r, physician p
where t.Speciality = r.Code and r.Name = 'RADIATION ONCOLOGY' and p.EmployeeID = t.Physician
group by t.Physician
having count(*) = (
	select count(*)
    from treatment t
    where t.Name = 'RADIATION ONCOLOGY'
);
