select ad.title as title, 
    ad.score as a_score, 
    md.score as m_score, 
    (ad.score-md.score) as score_gap, 
    ad.rank as a_rank, 
    md.rank as m_rank, 
    md.members as members,
    ad.fixed_aired,
    md.fixed_published
from {{ref("cleaned_anime")}} ad  
join {{ref("cleaned_manga")}} md  on ad.title = md.title
order by ad.score-md.score desc