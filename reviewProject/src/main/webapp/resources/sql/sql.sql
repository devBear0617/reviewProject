--------------------------------------------------------
--  파일이 생성됨 - 월요일-1월-21-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "REVIEWPROJECT"."BOARD" 
   (	"BOARDNUM" NUMBER(30,0), 
	"BOARDNAME" VARCHAR2(500 BYTE), 
	"BOARDDATE" DATE, 
	"BOARDUPDATE" DATE, 
	"BOARDCOUNT" VARCHAR2(20 BYTE), 
	"ID" VARCHAR2(70 BYTE), 
	"BOARDCONTENT" VARCHAR2(2000 BYTE), 
	"LIKE_COUNT" NUMBER, 
	"COM_COUNT" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "REVIEWPROJECT"."BOARD"."BOARDNUM" IS '글번호';
   COMMENT ON COLUMN "REVIEWPROJECT"."BOARD"."BOARDNAME" IS '제목';
   COMMENT ON COLUMN "REVIEWPROJECT"."BOARD"."BOARDDATE" IS '등록날짜';
   COMMENT ON COLUMN "REVIEWPROJECT"."BOARD"."BOARDUPDATE" IS '수정날짜';
   COMMENT ON COLUMN "REVIEWPROJECT"."BOARD"."BOARDCOUNT" IS '조회수';
   COMMENT ON COLUMN "REVIEWPROJECT"."BOARD"."ID" IS '글쓴이';
   COMMENT ON COLUMN "REVIEWPROJECT"."BOARD"."BOARDCONTENT" IS '게시글';
   COMMENT ON COLUMN "REVIEWPROJECT"."BOARD"."LIKE_COUNT" IS '좋아요 수';
   COMMENT ON COLUMN "REVIEWPROJECT"."BOARD"."COM_COUNT" IS '덧글 수';
--------------------------------------------------------
--  DDL for Table BOARDCOMMENT
--------------------------------------------------------

  CREATE TABLE "REVIEWPROJECT"."BOARDCOMMENT" 
   (	"COM_NUM" NUMBER, 
	"ID" VARCHAR2(70 BYTE), 
	"COM_CONTENT" VARCHAR2(2000 BYTE), 
	"COM_DATE" DATE, 
	"COM_UPDATE" DATE, 
	"BOARDNUM" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "REVIEWPROJECT"."BOARDCOMMENT"."COM_NUM" IS '덧글번호';
   COMMENT ON COLUMN "REVIEWPROJECT"."BOARDCOMMENT"."ID" IS '등록자';
   COMMENT ON COLUMN "REVIEWPROJECT"."BOARDCOMMENT"."COM_CONTENT" IS '덧글내용';
   COMMENT ON COLUMN "REVIEWPROJECT"."BOARDCOMMENT"."COM_DATE" IS '덧글날짜';
   COMMENT ON COLUMN "REVIEWPROJECT"."BOARDCOMMENT"."COM_UPDATE" IS '덧글 수정날짜';
   COMMENT ON COLUMN "REVIEWPROJECT"."BOARDCOMMENT"."BOARDNUM" IS '게시글번호';
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "REVIEWPROJECT"."MEMBER" 
   (	"ID" VARCHAR2(70 BYTE), 
	"PW" VARCHAR2(30 BYTE), 
	"NICKNAME" VARCHAR2(20 BYTE), 
	"GENDER" NUMBER(5,0), 
	"AGE" NUMBER(10,0), 
	"LIKESOMETHING" VARCHAR2(50 BYTE), 
	"GRADE" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "REVIEWPROJECT"."MEMBER"."ID" IS '회원ID';
   COMMENT ON COLUMN "REVIEWPROJECT"."MEMBER"."PW" IS '회원pw';
   COMMENT ON COLUMN "REVIEWPROJECT"."MEMBER"."NICKNAME" IS '닉네임';
   COMMENT ON COLUMN "REVIEWPROJECT"."MEMBER"."GENDER" IS '성별';
   COMMENT ON COLUMN "REVIEWPROJECT"."MEMBER"."AGE" IS '나이';
   COMMENT ON COLUMN "REVIEWPROJECT"."MEMBER"."LIKESOMETHING" IS '선호도';
   COMMENT ON COLUMN "REVIEWPROJECT"."MEMBER"."GRADE" IS '회원등급';
REM INSERTING into REVIEWPROJECT.BOARD
SET DEFINE OFF;
REM INSERTING into REVIEWPROJECT.BOARDCOMMENT
SET DEFINE OFF;
REM INSERTING into REVIEWPROJECT.MEMBER
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index BOARDTYPE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "REVIEWPROJECT"."BOARDTYPE_PK" ON "REVIEWPROJECT"."BOARD" ("BOARDNUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MEMBER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "REVIEWPROJECT"."MEMBER_PK" ON "REVIEWPROJECT"."MEMBER" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index COMENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "REVIEWPROJECT"."COMENT_PK" ON "REVIEWPROJECT"."BOARDCOMMENT" ("COM_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "REVIEWPROJECT"."BOARD" ADD CONSTRAINT "BOARDTYPE_PK" PRIMARY KEY ("BOARDNUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "REVIEWPROJECT"."BOARD" MODIFY ("BOARDNUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "REVIEWPROJECT"."MEMBER" ADD CONSTRAINT "MEMBER_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "REVIEWPROJECT"."MEMBER" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARDCOMMENT
--------------------------------------------------------

  ALTER TABLE "REVIEWPROJECT"."BOARDCOMMENT" ADD CONSTRAINT "COMENT_PK" PRIMARY KEY ("COM_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "REVIEWPROJECT"."BOARDCOMMENT" MODIFY ("COM_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "REVIEWPROJECT"."BOARD" ADD CONSTRAINT "BOARD_FK1" FOREIGN KEY ("ID")
	  REFERENCES "REVIEWPROJECT"."MEMBER" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOARDCOMMENT
--------------------------------------------------------

  ALTER TABLE "REVIEWPROJECT"."BOARDCOMMENT" ADD CONSTRAINT "BOARDCOMMENT_FK1" FOREIGN KEY ("ID")
	  REFERENCES "REVIEWPROJECT"."MEMBER" ("ID") ENABLE;
  ALTER TABLE "REVIEWPROJECT"."BOARDCOMMENT" ADD CONSTRAINT "BOARDCOMMENT_FK2" FOREIGN KEY ("BOARDNUM")
	  REFERENCES "REVIEWPROJECT"."BOARD" ("BOARDNUM") ENABLE;
