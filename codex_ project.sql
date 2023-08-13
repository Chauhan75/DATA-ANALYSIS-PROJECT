##1. Demographic Insights (examples)

##a. Who prefers energy drink more? (male/female/non-binary?)

select  gender, count(*) as gender_count
from dim_repondents dr
join fact_survey_responses fsc
on dr.respondent_id = fsc.Respondent_ID
where Consume_frequency in ('2-3 times a week','2-3 times a month','Rarely','Daily','Once a week')
group by gender
order by gender_count desc;


##b. Which age group prefers energy drinks more?

select age , count(*) as age_gp_count
from dim_repondents dr
join fact_survey_responses fsc
on dr.respondent_id = fsc.Respondent_ID
where Consume_frequency in ('2-3 times a week','2-3 times a month','Rarely','Daily','Once a week')
group by age
order by age_gp_count desc;

##c. Which type of marketing reaches the most Youth (15-30)?

select marketing_channels, count(*) as no_channels
from fact_survey_responses fsc
join dim_repondents dr
on dr.respondent_id = fsc.Respondent_ID
where age in ('15-18' , '19-30')
group by Marketing_channels
order by no_channels desc;

##2. Consumer Preferences:

##a. What are the preferred ingredients of energy drinks among respondents?

select ingredients_expected , count(*) as total_respondents from fact_survey_responses
group by Ingredients_expected
order by  total_respondents desc;

##b. What packaging preferences do respondents have for energy drinks?

select packaging_preference , count(*) as respondents_packaging
from fact_survey_responses
group by Packaging_preference
order by respondents_packaging desc;

##3. Competition Analysis:

##a. Who are the current market leaders?

select current_brands , count(*) as brand_count
from  fact_survey_responses
group by Current_brands
order by brand_count desc;

##b. What are the primary reasons consumers prefer those brands over ours?

select reasons_for_choosing_brands , count(*) as total_reasons
from   fact_survey_responses
group by reasons_for_choosing_brands
order by  total_reasons desc;

##4. Marketing Channels and Brand Awareness:

##a. Which marketing channel can be used to reach more customers?

select marketing_channels , count(*) as cnt_market
from fact_survey_responses
group by marketing_channels
order by cnt_market desc;

##b. How effective are different marketing strategies and channels in reaching our customers?

select marketing_channels , count(respondent_id) as total_respondent ,Current_brands
from fact_survey_responses
where Current_brands = "codex"
group by Marketing_channels
order by total_respondent desc;

##5. Brand Penetration:

##a. What do people think about our brand? (overall rating)

select taste_experience , count(respondent_id) as total_response
from fact_survey_responses
where Current_brands="codex"
group by Taste_experience
order by Taste_experience desc;

##b. Which cities do we need to focus more on?

SELECT dim_repondents.City_id, COUNT(*) as Total_Responses
FROM dim_repondents
JOIN fact_survey_responses ON dim_repondents.Respondent_ID = fact_survey_responses.Respondent_ID
WHERE fact_survey_responses.Current_brands = 'codex'
GROUP BY dim_repondents.City_id
ORDER BY Total_Responses DESC;

##6. Purchase Behavior:

##a. Where do respondents prefer to purchase energy drinks?

SELECT Purchase_location, COUNT(*) 
FROM fact_survey_responses 
GROUP BY Purchase_location 
ORDER BY COUNT(*) DESC;

##b. What  are the typical consumption situations for energy drinks among respondents?

select distinct Typical_consumption_situations, count(*) as total_count  
from fact_survey_responses
 group by Typical_consumption_situations
 order by total_count desc;
 
##c. What factors influence respondents' purchase decisions, such as price range and limited edition packaging?

SELECT Price_range, COUNT(*) 
FROM fact_survey_responses 
GROUP BY Price_range
order by count(*) desc;

##7. Product Development

##a. Which area of business should we focus more on our product development? (Branding/taste/availability)

select reasons_for_choosing_brands , count(*) as total_response
from fact_survey_responses
group by reasons_for_choosing_brands
order by total_response desc;
