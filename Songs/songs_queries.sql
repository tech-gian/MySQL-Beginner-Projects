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
select t.titlos
from singer_prod s, tragoudi t, group_prod g
where s.title = t.titlos and g.title = s.title;

-- 6th query
select k.onoma, k.epitheto
from kalitexnis k, singer_prod s, tragoudi t
where s.title = t.titlos and t.sinthetis = k.ar_taut and s.title not in (
	select group_prod.title
    from group_prod)
group by k.onoma, k.epitheto
having count(distinct s.tragoudistis) = 1;


-- 7th query
select g.title
from group_prod g
where not exists (
	select s.title
	from singer_prod s);
