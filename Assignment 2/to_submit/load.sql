\c db2016;
SET search_path TO assignment2,public;

INSERT INTO "Country" ( code, name, capital, area ) VALUES
    ( 'A', 'Austria', 'Vienna', 83879 ),
    ( 'L', 'Luxembourg', 'Luxembourg City', 25864 ),
    ( 'N', 'Norway', 'Oslo', 385178 ),
    ( 'J', 'Japan', 'Tokyo', 377984 ),
    ( 'I', 'Italy', 'Rome' , 301338 ),
    ( 'BDS', 'Barbados', 'Bridgetown', 439 ),
    ( 'CH', 'Switzerland', 'Bern', 41285 ),
    ( 'DK', 'Denmark', 'Copenhagen', 429257 ),
    ( 'EAU', 'Uganda', 'Kampala', 241038 ),
    ( 'EST', 'Estonia', 'Tallinn', 45339),
    ( 'GCA', 'Guatemala', 'Guatemala City', 108889 ),
    ( 'GUY', 'Guyana', 'Georgetown', 214970 );
    
INSERT INTO "Population" ( country, population, children, adult, 
        birth_rate, death_rate, sex_ratio ) VALUES
    ( 'I', 60795612, 13, 66, 9, 10, 106 ),
    ( 'A', 8572895, 14, 67, 9, 10, 105 ),
    ( 'L', 562958, 19, 67, 11, 4, 107 ),
    ( 'N', 5165802, 19, 66, 11, 4, 105 ),
    ( 'J', 126919659, 13, 62, 10, 4, 106 ),
    ( 'BDS', 277821, 20, 67, 12, 8, 92 ),
    ( 'CH', 8211700, 36, 56, 25, 14, 100 ),
    ( 'DK', 5581503, 36, 65, 10, 10, 97 ),
    ( 'EAU', 37101745, 48, 50, 44, 11, 99 ),
    ( 'EST', 1265420, 16, 65, 11, 12, 87 ),
    ( 'GCA', 14918999, 36, 60, 25, 5, 97 ),
    ( 'GUY', 735222, 28, 67, 16, 7, 102 );

INSERT INTO "Economy" ( country, "GDP", inflation, military, 
        poverty ) VALUES
    ( 'I', 2148, 0, 2, 30 ),
    ( 'A', 4371, 2, 1, 4 ),
    ( 'N', 3452, 2, 1, 0 ),
    ( 'J', 4751, 2, 1, 16 ),
    ( 'L', 5141, 1, 1, 0 ),
    ( 'BDS', 4516, 2, 0, 0 ),
    ( 'CH', 7121, 0, 8, 1 ),
    ( 'DK', 2495, 1, 1, 13 ),
    ( 'EAU', 7694, 5, 2, 20 ),
    ( 'EST', 3562, 0, 2, 22 ),
    ( 'GCA', 1191, 3, 1, 54 ),
    ( 'GUY', 5514, 1, 1, 35 );

INSERT INTO "Language" ( country, language, percentage ) VALUES
    ( 'I', 'Italian',  90 ),
    ( 'J', 'Japanese', 98 ),    
    ( 'J', 'Koreans', 1 ), 
    ( 'J', 'Chinese', 1 ), 
    ( 'A', 'Austrians', 91 ), 
    ( 'A', 'Yugoslavs', 4 ), 
    ( 'A', 'Turks', 2 ), 
    ( 'A', 'German', 1 ), 
    ( 'N', 'Norwegian', 94 ), 
    ( 'L', 'Luxembourger', 57 ), 
    ( 'L', 'Portuguese', 16 ), 
    ( 'L', 'French', 6 ), 
    ( 'L', 'Italian', 3 ), 
    ( 'L', 'Belgian', 3 ), 
    ( 'L', 'German', 2 ), 
    ( 'L', 'British', 1 ), 
    ( 'BDS', 'English', 95 ), 
    ( 'CH', 'German', 64 ), 
    ( 'CH', 'French', 23 ), 
    ( 'CH', 'Italian', 8 ), 
    ( 'CH', 'English', 8 ), 
    ( 'CH', 'Serbo-Croatian', 3 ), 
    ( 'CH', 'Albanian', 3 ), 
    ( 'CH', 'Portuguese', 3 ), 
    ( 'CH', 'Spanish', 3 ), 
    ( 'DK', 'Danish', 98 ), 
    ( 'EAU', 'English', 98 ), 
    ( 'EST', 'Estonian', 69 ), 
    ( 'EST', 'Russian', 30 ), 
    ( 'EST', 'Ukrainian', 1 ), 
    ( 'GCA', 'Spanish', 60 ), 
    ( 'GCA', 'Amerindian', 40 ), 
    ( 'GUY', 'English', 70 ), 
    ( 'GUY', 'Guyanese Creole', 30 );



