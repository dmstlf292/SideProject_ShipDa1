
CREATE TABLE fcl (
	no               int(11) NOT NULL  auto_increment,
	departure             varchar(20),
	country			varchar(20),
	adrress			 varchar(50),
	transit			 varchar(50),
	
	arrive          varchar(50),
	acountry			varchar(20),
	aAdrress			 varchar(50),
	
	
	incoterms              varchar(20),
	item           varchar(20)                    ,
	ctype          varchar(20)                    ,
	csize           varchar(20)                    ,
	volume          int(11)                  ,
	danger			varchar(20),
	lss				 varchar(20),
	surcharge		varchar(20),
	extra			varchar(20),
	entry			varchar(20),
	client			varchar(20),
	
	ref               smallint(7) ,
	pos                smallint(7) unsigned ,
	depth             smallint(7) unsigned,
	regdate         date  ,
	pass             varchar(15) ,
	count             smallint(7) unsigned,
	
	PRIMARY KEY ( no )
)COLLATE='euckr_korean_ci';
