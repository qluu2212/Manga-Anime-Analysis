with a_cte as (
	select * from {{ref("raw_anime")}}
	where right(aired,1) = '-'
)
select * from (
	select *, concat(a_cte.aired, ' Dec 2023') as fixed_aired from a_cte
	union all
	select *, concat({{ref("raw_anime")}}.aired, '') as fixed_aired from {{ref("raw_anime")}}
	where right(aired,1) <> '-'
	order by aid
) anime_dataset
where length(fixed_aired) > 15