with cte as (
	select * from {{ref("raw_manga")}}
	where right(published,1) = '-'
)
select * from (
	select *, concat(cte.published, ' Dec 2023') as fixed_published from cte
	union all
	select *, concat({{ref("raw_manga")}}.published, '') as fixed_published from {{ref("raw_manga")}}
	where right(published,1) <> '-'
	order by mid
) manga_dataset
where length(fixed_published) > 15