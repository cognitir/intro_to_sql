-- The following examples can be put up to work on pattern matching with students --
-- Answers are located at the very end of the text --

--Sample 1: 
SELECT first 
FROM realtor_info
WHERE first ILIKE '%Da';

--Sample 2: 
SELECT first 
FROM realtor_info
WHERE first ILIKE '%Da%';

--Sample 3:
SELECT first 
FROM realtor_info
WHERE first ILIKE 'Da%';

--Sample 4: 
SELECT first 
FROM realtor_info
WHERE first ILIKE 'Da';

--Sample 5: 
SELECT first 
FROM realtor_info
WHERE first ILIKE 'D%a';

--Sample 6: 
SELECT first 
FROM realtor_info
WHERE first ILIKE '_%a';

--Sample 7: 
SELECT first 
FROM realtor_info
WHERE first ILIKE '_ia';

--Sample 8: 
SELECT first 
FROM realtor_info
WHERE first ILIKE '%D%a%';


Sample 1: Produces output ending in 'da' - case insensitive

Sample 2: Produces output where 'da' exists anywhere - case insensitive 

Sample 3: Produces output where 'da' is at the start of the word - case insensitive

Sample 4: Produces output where 'da' is the actual name - case insensitive

Sample 5: Produces output where word starts with 'd' and ends with 'a' - any length - case insensitive

Sample 6: Produces output where word starts with anything and ends with 'a'

Sample 7: Any singular character start, followed with 'ia'

Sample 8: Produces output for any 'd' followed by 'a' combination, does not have to be in order. 