-- db indexed_cars


CREATE TABLE car_models
(
 id serial,
 make_code character varying(125) NOT NULL,
 make_title character varying(125) NOT NULL,
 model_code character varying(125) NOT NULL,
 model_title character varying(125) NOT NULL,
 year integer NOT NULL,
 PRIMARY KEY (id)
)




-- CREATE INDEX lambo
-- ON car_models (make_title);

-- CREATE INDEX nissan
-- ON car_models (model_title);

-- CREATE INDEX lamboinfos
-- ON car_models (make_code);

-- CREATE INDEX years
-- ON car_models (year);