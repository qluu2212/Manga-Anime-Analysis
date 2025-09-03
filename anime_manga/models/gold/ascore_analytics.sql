select score , count(score) as amount
from {{ref("cleaned_anime")}}
group by score