
CREATE TABLE public."User" (
	user_id int8 Not NULL primary key,
	user_name varchar NULL,
	user_added_date _date NULL,
	user_password varchar NULL,
	user_mobile int4 NULL
);
SELECT * FROM note;

CREATE TABLE public.note (
	note_id int8 NOT NULL primary key,
	note_title varchar NULL,
	note_content varchar NULL,
	note_status int NULL,
	note_creation_date _date NULL
);
SELECT * FROM public."User";

CREATE TABLE public."Category" (
	category_id int8 NOT NULL,
	category_name varchar NULL,
	category_descr varchar NULL,
	category_creation_date _date NULL,
	category_creator varchar NULL,
	CONSTRAINT category_pk PRIMARY KEY (category_id)
);

CREATE TABLE public.Reminder (
	reminder_id int8 NOT NULL,
	reminder_name varchar NULL,
	reminder_descr varchar NULL,
	reminder_type varchar NULL,
	reminder_creation_date _date NULL,
	reminder_creator varchar NULL,
	CONSTRAINT reminder_pk PRIMARY KEY (reminder_id)
);

CREATE TABLE public.notecategory (
	notecategory_id int8 NOT NULL,
	note_id int8 NOT NULL,
	category_id int8 NOT NULL,
	CONSTRAINT notecategory_pk PRIMARY KEY (notecategory_id),
	CONSTRAINT notecategory_fk FOREIGN KEY (note_id) REFERENCES public."Note"(note_id),
	CONSTRAINT notecategory_fk_1 FOREIGN KEY (category_id) REFERENCES public."Category"(category_id)
);

CREATE TABLE public.notereminder (
	notereminder_id int8 NOT NULL,
	note_id int8 NULL,
	reminder_id int8 NULL,
	CONSTRAINT notereminder_pk PRIMARY KEY (notereminder_id),
	CONSTRAINT notereminder_fk FOREIGN KEY (note_id) REFERENCES public."Note"(note_id),
	CONSTRAINT notereminder_fk_1 FOREIGN KEY (reminder_id) REFERENCES public."Reminder"(reminder_id)
);


CREATE TABLE public.usernote (
	usernote_id int8 NULL,
	user_id int8 NULL,
	note_id int8 NULL,
	CONSTRAINT usernote_pk PRIMARY KEY (usernote_id),
	CONSTRAINT usernote_fk FOREIGN KEY (user_id) REFERENCES public."User"(user_id),
	CONSTRAINT usernote_fk_1 FOREIGN KEY (note_id) REFERENCES public."Note"(note_id)
);


INSERT INTO public."Note" (note_id,note_title,note_content,note_status,note_creation_date)
	VALUES (1,'note1','note1 content',0,'{''2012-12-12''}');
INSERT INTO public."Note" (note_id,note_title,note_content,note_status,note_creation_date)
	VALUES (2,'note2','note2 content',1,'{''2011-11-11''}');
INSERT INTO public."Note" (note_id,note_title,note_content,note_status,note_creation_date)
	VALUES (3,'note3','note3 content',1,'{''2010-10-10''}');

SELECT * FROM "Note" n ;


INSERT INTO public."Category" (category_id,category_name,category_descr,category_creation_date,category_creator)
	VALUES (1,'category1','category1 description','{''2012-12-12''}','category1 creater');
INSERT INTO public."Category" (category_id,category_name,category_descr,category_creation_date,category_creator)
	VALUES (2,'category2','category2 description','{''2011-11-11''}','category2 creater');
SELECT * FROM public."Category";


INSERT INTO public."Reminder" (reminder_id,reminder_name,reminder_descr,reminder_type,reminder_creation_date,reminder_creator)
	VALUES (1,'reminder1','reminder1 description','0','{''2012-12-12''}','reminder1 creater');
INSERT INTO public."Reminder" (reminder_id,reminder_name,reminder_descr,reminder_type,reminder_creation_date,reminder_creator)
	VALUES (2,'reminder2','reminder2 description','1','{''2011-11-11''}','reminder2 creater');
SELECT * FROM public."Reminder";


INSERT INTO public."User" (user_id,user_name,user_added_date,user_password,user_mobile)
	VALUES (1,'user1','{''2012-12-12''}','root',989898);
INSERT INTO public."User" (user_id,user_name,user_added_date,user_password,user_mobile)
	VALUES (2,'user2','{''2011-11-11''}','root',979797);
SELECT * FROM public."User";


INSERT INTO public."Usernote"
(usernote_id, user_id, note_id)
VALUES(1, 1, 1);
INSERT INTO public."Usernote"
(usernote_id, user_id, note_id)
VALUES(2, 2, 2);
SELECT * FROM public."Usernote";


INSERT INTO public."Notereminder" (notereminder_id,note_id,reminder_id)
	VALUES (1,1,1);
INSERT INTO public."Notereminder" (notereminder_id,note_id,reminder_id)
	VALUES (2,2,2);
SELECT * FROM public."Notereminder";


INSERT INTO public."Notecategory" (notecategory_id,note_id,category_id)
	VALUES (1,2,1);
INSERT INTO public."Notecategory" (notecategory_id,note_id,category_id)
	VALUES (2,2,2);
SELECT * FROM public."Notecategory";


SELECT user_id, user_name, user_added_date, user_password, user_mobile
FROM public."User" WHERE user_id =1;
SELECT user_id, user_name, user_added_date, user_password, user_mobile
FROM public."User" WHERE user_password ='root';


SELECT note_id, note_title, note_content, note_status, note_creation_date
FROM public."Note" WHERE note_creation_date ='{''2011-11-11''}';


SELECT category_id, category_name, category_descr, category_creation_date, category_creator
FROM public."Category" WHERE category_creation_date > '{''2011-11-11''}';


SELECT usernote_id, user_id, note_id
FROM public."Usernote" WHERE user_id =1;


UPDATE public."Note" SET note_status=0 WHERE note_id=3;
SELECT * FROM public."Note";


SELECT * FROM "Note" n WHERE note_id = (SELECT u.usernote_id note_id from "Usernote" u WHERE u.user_id=1);


SELECT * FROM "Note" n WHERE n.note_id = (SELECT n2.note_id from "Notecategory" n2 WHERE n2.category_id=1);


SELECT * FROM "Reminder" r WHERE r.reminder_id = (SELECT n.reminder_id from "Notereminder" n WHERE n.note_id=1);


SELECT * FROM "Reminder" r WHERE r.reminder_id = 1;


INSERT INTO public."Usernote" (usernote_id, user_id, note_id) VALUES(3, 1, 2);


INSERT INTO public."Notecategory"
(notecategory_id, note_id, category_id)
VALUES(3, 2, 1);


INSERT INTO public."Notereminder"
(notereminder_id, note_id, reminder_id)
VALUES(3, 2, 1);


DELETE FROM public."Usernote"
WHERE usernote_id=3;


DELETE FROM public."Notecategory"
WHERE notecategory_id=3;


create trigger del_note before delete
 on Note
 FOR EACH ROW
  Begin
   delete from UserNote where note_id=old.note_id;
   delete from Notereminder where note_id=old.note_id;
   delete from NoteCategory where note_id=old.note_id;
  END;

