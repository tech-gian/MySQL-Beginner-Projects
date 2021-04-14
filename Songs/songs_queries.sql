use songs;

-- 1st query
select etaireia, count(*) as Synolo
from cd_production
group by etaireia;

-- 2nd query
select t.titlos
from tragoudi t
where t.sinthetis = t.stixourgos;

-- 3rd query
select s.title
from singer_prod s
group by title
having count(*) > 1;

-- 4rd query
select s.tragoudistis, count(distinct s.cd)
from singer_prod s
group by s.tragoudistis;

-- 5th query
select distinct s.title
from singer_prod s, cd_production c
where c.code_cd = s.cd
union
select distinct g.title
from group_prod g, cd_production c
where c.code_cd = g.cd;

-- 6th query
select k.onoma, k.epitheto
from kalitexnis k
where k.ar_taut in (
	select t.sinthetis
	from tragoudi t
	where t.titlos in (
		select s.title
		from singer_prod s
		group by s.title
		having count(distinct s.tragoudistis=1)));

-- 7th query
select g.title
from group_prod g
where not exists (
	select s.title
	from singer_prod s);
