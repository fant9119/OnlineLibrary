--------------------------------------------------------
--  File created - Friday-March-25-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence BOOK_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "RK"."BOOK_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence USER_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "RK"."USER_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table BOOKS
--------------------------------------------------------

  CREATE TABLE "RK"."BOOKS" 
   (	"ID" NUMBER(19,0), 
	"BOOK_AUTHOR" VARCHAR2(255 CHAR), 
	"BOOK_GENRE" VARCHAR2(255 CHAR), 
	"BOOK_INFO" LONG, 
	"BOOK_PDF" BLOB, 
	"BOOK_TITLE" VARCHAR2(255 CHAR), 
	"USER_ID" NUMBER(19,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" 
 LOB ("BOOK_PDF") STORE AS (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 PCTVERSION 10
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "RK"."USERS" 
   (	"ID" NUMBER(19,0), 
	"USER_LOGIN" VARCHAR2(255 CHAR), 
	"USER_PASSWORD" VARCHAR2(255 CHAR), 
	"USER_ROLE" NUMBER(10,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table USERS_BOOKS
--------------------------------------------------------

  CREATE TABLE "RK"."USERS_BOOKS" 
   (	"USERS_ID" NUMBER(19,0), 
	"BOOKS_ID" NUMBER(19,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into RK.BOOKS
SET DEFINE OFF;
Insert into RK.BOOKS (ID,BOOK_AUTHOR,BOOK_GENRE,BOOK_INFO,BOOK_TITLE,USER_ID) values (1,'Дэн Браун','детектив, боевик, приключения','Дэн Браун возвращается с новым захватывающим сюжетом, в котором соединились история, искусство, коды и символы — в лучших традициях романов автора мирового бестселлера «Код да Винчи».

В самом сердце Италии профессор религиозной символогии Роберт Лэнгдон оказывается вовлечен в исследование одного из самых таинственных литературных шедевров — «Божественной комедии» Данте. На этом пути Лэнгдон встретится с пугающим противником и возьмется разгадать загадку, которая затянет его в мир классического искусства, потайных троп и науки будущего. Опираясь на строки эпической поэмы Данте, Лэнгдон должен успеть найти ответы и решить, кому доверять… прежде чем мир безвозвратно изменится.','Инферно',null);
Insert into RK.BOOKS (ID,BOOK_AUTHOR,BOOK_GENRE,BOOK_INFO,BOOK_TITLE,USER_ID) values (2,'Стивен Кинг','фантастика','Обычным, пригожим осенним днем, город Честерс Миллз, штат Мэн, был внезапно отрезан от остального мира невидимым силовым барьером. Самолеты врезаются в купол и падают, пылая, с небес; садовнику отрезает силовым полем руку; люди, выехавшие в соседний город по делам, не могут вернуться к своим близким; автомобили взрываются от столкновения с куполом. Никто не понимает, что это за барьер, откуда он взялся и исчезнет ли он.','Под куполом',null);
Insert into RK.BOOKS (ID,BOOK_AUTHOR,BOOK_GENRE,BOOK_INFO,BOOK_TITLE,USER_ID) values (3,'Дэн Браун','детектив, боевик, триллер','Приключения Роберта Лэнгдона продолжаются. На этот раз ему предстоит разгадать величайшую тайну масонов, которая способна изменить мир. Веками хранимые секреты, загадочные знаки и символы - и смертельно опасное путешествие по лабиринтам прошлого…','Утраченный символ',null);
Insert into RK.BOOKS (ID,BOOK_AUTHOR,BOOK_GENRE,BOOK_INFO,BOOK_TITLE,USER_ID) values (4,'Джордж Мартин','фэнтези, приключения','"Игра престолов" – это суровые земли вечного холода и радостные земли вечного лета. Это легенда о лордах и героях, воинах и магах, убийцах и чернокнижниках, которых свело вместе исполнение древнего пророчества. Это история о таинственных воителях, что сражаются мечами из неведомого металла, и о племени странных созданий, что повергают своих врагов в безумие. Это сказание о жестоком принце драконов, готовом на все, дабы вернуть утраченный трон, и ребенке, что блуждает по сумеречному миру меж жизнью и смертью. Это трагедии и предательства, битвы и интриги, поражения и победы. Это игра, в которой ставка высока...','Игра престолов',null);
Insert into RK.BOOKS (ID,BOOK_AUTHOR,BOOK_GENRE,BOOK_INFO,BOOK_TITLE,USER_ID) values (5,'Сьюзен Коллинз','фантастика, боевик','Книга-сенсация, возглавившая 21 список бестселлеров и удостоенная множества литературных наград.
Эти парень и девушка знакомы с детства и еще могут полюбить друг друга, но им придется стать врагами… По жребию они должны участвовать в страшных «Голодных играх», где выживает только один — сильнейший. Пока в жестком квесте остаются хотя бы какие-то участники, Китнисс и Пит могут защищать друг друга и сражаться вместе. Но рано или поздно кому-то из них придется пожертвовать жизнью ради любимого… Таков закон «Голодных игр». Закон, который не нарушался еще никогда!','Голодные игры',null);
Insert into RK.BOOKS (ID,BOOK_AUTHOR,BOOK_GENRE,BOOK_INFO,BOOK_TITLE,USER_ID) values (6,'Оскар Уайльд','европейская старинная литература','Интрига романа построена на мотиве сделки с дьяволом, в которой задействован магический портрет, играющий в судьбе героя роковую роль. В один из дней художник Бэзил Холлуорд написал портрет молодого и прекрасного Дориана Грея, и в этот портрет влюбляется сам Дориан. Юный красавец, любуясь своим изображением, не может избавиться от мысли, что портрет будет всегда обладать тем, чего он неизбежно лишится, — молодости. «О, если бы было наоборот! Если бы портрет менялся, а я мог всегда оставаться таким, как сейчас! Я бы душу дьяволу продал за это!» Мольба была услышана, и пожелание исполнилось!','Портрет Дориана Грея',null);
Insert into RK.BOOKS (ID,BOOK_AUTHOR,BOOK_GENRE,BOOK_INFO,BOOK_TITLE,USER_ID) values (7,'Эрих Мария Ремарк','проза, любовный роман','Самый красивый в XX столетии роман о любви...
Самый увлекательный в XX столетии роман о дружбе...
Самый трагический и пронзительный роман о человеческих отношениях за всю историю XX столетия.','Три товарища',null);
Insert into RK.BOOKS (ID,BOOK_AUTHOR,BOOK_GENRE,BOOK_INFO,BOOK_TITLE,USER_ID) values (9,'Габриель Гарсиа Маркес','проза, современная проза','Люди живут и носят одни и те же имена – и разные, почти карнавальные, маски. Кто отличит героя от предателя, а шлюху – от святой? Различия в затерянном мире городка Макондо очень условны. Ибо там давно уже «порвалась дней связующая нить». И никому ее несоединить. Ни смертным. Ни судьбе. Ни Богу…','Сто лет одиночества',null);
REM INSERTING into RK.USERS
SET DEFINE OFF;
Insert into RK.USERS (ID,USER_LOGIN,USER_PASSWORD,USER_ROLE) values (1,'admin','admin',0);
Insert into RK.USERS (ID,USER_LOGIN,USER_PASSWORD,USER_ROLE) values (2,'login','1',1);
REM INSERTING into RK.USERS_BOOKS
SET DEFINE OFF;
Insert into RK.USERS_BOOKS (USERS_ID,BOOKS_ID) values (1,1);
Insert into RK.USERS_BOOKS (USERS_ID,BOOKS_ID) values (1,2);
Insert into RK.USERS_BOOKS (USERS_ID,BOOKS_ID) values (1,5);
Insert into RK.USERS_BOOKS (USERS_ID,BOOKS_ID) values (1,9);
Insert into RK.USERS_BOOKS (USERS_ID,BOOKS_ID) values (2,4);
--------------------------------------------------------
--  DDL for Index UK_7LXVSJITKGXA7SCU75CUJ06HN
--------------------------------------------------------

  CREATE UNIQUE INDEX "RK"."UK_7LXVSJITKGXA7SCU75CUJ06HN" ON "RK"."USERS_BOOKS" ("BOOKS_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "RK"."USERS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "RK"."USERS" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BOOKS
--------------------------------------------------------

  ALTER TABLE "RK"."BOOKS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "RK"."BOOKS" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table USERS_BOOKS
--------------------------------------------------------

  ALTER TABLE "RK"."USERS_BOOKS" MODIFY ("USERS_ID" NOT NULL ENABLE);
 
  ALTER TABLE "RK"."USERS_BOOKS" MODIFY ("BOOKS_ID" NOT NULL ENABLE);
 
  ALTER TABLE "RK"."USERS_BOOKS" ADD PRIMARY KEY ("USERS_ID", "BOOKS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "RK"."USERS_BOOKS" ADD CONSTRAINT "UK_7LXVSJITKGXA7SCU75CUJ06HN" UNIQUE ("BOOKS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOOKS
--------------------------------------------------------

  ALTER TABLE "RK"."BOOKS" ADD CONSTRAINT "FK_SRAJTSQEMAUJTKIFC6V2G84VF" FOREIGN KEY ("USER_ID")
	  REFERENCES "RK"."USERS" ("ID") ENABLE;

--------------------------------------------------------
--  Ref Constraints for Table USERS_BOOKS
--------------------------------------------------------

  ALTER TABLE "RK"."USERS_BOOKS" ADD CONSTRAINT "FK_7LXVSJITKGXA7SCU75CUJ06HN" FOREIGN KEY ("BOOKS_ID")
	  REFERENCES "RK"."BOOKS" ("ID") ENABLE;
 
  ALTER TABLE "RK"."USERS_BOOKS" ADD CONSTRAINT "FK_7USI9GCNQQQ6AF13WN21XW1RO" FOREIGN KEY ("USERS_ID")
	  REFERENCES "RK"."USERS" ("ID") ENABLE;
