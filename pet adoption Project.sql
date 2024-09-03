
CREATE DATABASE Pet_AdoptionData;
USE Pet_AdoptionData;

CREATE TABLE pet_adoptiondata (
    PetID INT PRIMARY KEY,
    PetType VARCHAR(100),
    Breed VARCHAR(100),
    AgeMonth INT,
    Color VARCHAR(100),
    Size VARCHAR(100),
    WeightKg FLOAT,
    Vaccinated INT,
    HealthCondition INT,
    TimeInShelterDays INT,
    AdoptionFee INT,
    PreviousOwner INT,
    AdoptionLikelihood INT
);

/*what are the most common pet type are available for adoption and how does there average age compare */ 
SELECT * FROM pet_adoptiondata.pet_adoption_data;
SELECT PetType, 
       COUNT(*) AS count, 
       AVG(AgeMonths) AS AverageAgeInMonths
FROM pet_adoption_data
GROUP BY PetType
ORDER BY count DESC, AverageAgeInMonths
LIMIT 0, 1000;

/* how does the vaccination status effect the likelihood of adoption*/
SELECT Vaccinated, 
       COUNT(*) AS TotalPets, 
       SUM(CASE WHEN AdoptionLikelihood = 'Adopted' THEN 1 ELSE 0 END) AS AdoptedPets, 
       (SUM(CASE WHEN AdoptionLikelihood = 'Adopted' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS AdoptionRate
FROM pet_adoption_data
GROUP BY Vaccinated
ORDER BY AdoptionRate DESC
LIMIT 0, 1000;

/*Which breeds have the highest adoption fee,and how do they typicaly stay in shelter*/
SELECT Breed, 
       AVG(AdoptionFee) AS AverageAdoptionFee, 
       AVG(TimeInShelterDays) AS AverageTimeInShelterDays
FROM pet_adoption_data
GROUP BY Breed
ORDER BY AverageAdoptionFee DESC;
