select score , count(score) as amount
from {{ref("cleaned_manga")}}
group by score