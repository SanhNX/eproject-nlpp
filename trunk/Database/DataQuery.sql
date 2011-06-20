
-----------------tbl_MailingList---------------------
go 
USE NLPP_Eproject
INSERT INTO tbl_MailingList VALUES ('bingonj@gmail.com')
INSERT INTO tbl_MailingList VALUES ('hotarunw@gmail.com')
INSERT INTO tbl_MailingList VALUES ('nguyenxuantien3105@gmail.com')
INSERT INTO tbl_MailingList VALUES ('jhenry2106@gmail.com')
INSERT INTO tbl_MailingList VALUES ('johnhenry@gmail.com')
INSERT INTO tbl_MailingList VALUES ('phong2931@fpt.edu.vn')
INSERT INTO tbl_MailingList VALUES ('nguoivohinh40@yahoo.com')
INSERT INTO tbl_MailingList VALUES ('nghvinh.qn0511@yahoo.com.vn')
INSERT INTO tbl_MailingList VALUES ('nicktoi2606@yahoo.com')
INSERT INTO tbl_MailingList VALUES ('thinkofu@thinkhigh.com')
INSERT INTO tbl_MailingList VALUES ('ghostvander@gmail.com')
INSERT INTO tbl_MailingList VALUES ('aphu_dudu@yahoo.com')
INSERT INTO tbl_MailingList VALUES ('yolanda1610@yahoo.com')
INSERT INTO tbl_MailingList VALUES ('yolandahoahongden1610@yahoo.com.vn')
INSERT INTO tbl_MailingList VALUES ('kequaqs21@gmail.com')
INSERT INTO tbl_MailingList VALUES ('bind202@yahoo.com')
INSERT INTO tbl_MailingList VALUES ('mr.ken72@yahoo.com')
INSERT INTO tbl_MailingList VALUES ('kindofme@gmail.com')
INSERT INTO tbl_MailingList VALUES ('dindinloveyou1237@yahoo.com')

--------------------tbl_Role-----------------------------------
go 
USE NLPP_Eproject
INSERT INTO tbl_Role(Name,Description) VALUES ('admin','Manager WebSite')
INSERT INTO tbl_Role(Name,Description) VALUES ('user','Members Of WebSite')
----------------------------tbl_User ---------------------------
go 
USE NLPP_Eproject

INSERT INTO tbl_User 
VALUES ('admin','admin','admininstrator','5/5/1989','true','453 Le Van Sy,Q.3','0938357222',1)
INSERT INTO tbl_User 
VALUES ('bingonj@gmail.com','whoami','Day Walker','2/2/1989','true','453 Le Van Sy,Q.3','0938357222',1)
INSERT INTO tbl_User 
VALUES ('hotarunw@gmail.com','bleble','John Smith','12/2/1983','true','131 No Trang Long,Q.BT','0122234324',2)
INSERT INTO tbl_User 
VALUES ('jhenry2106@gmail.com','miyouta','Tran Van Dau','5/12/1986','true','21 Le Thanh Ton,Q.1','0122673983',2)
INSERT INTO tbl_User 
VALUES ('nguoivohinh40@yahoo.com','askgod2know','Nguyen Xuan Tien','05/31/1989','true','2 duong 3/2,q.3 ','0908234123',2)
INSERT INTO tbl_User 
VALUES ('aphu_dudu@yahoo.com','phieudu','Le Van Cuong','12/2/1983','true','123 Quoc Lo 1, Binh Quoc','082372361',2)
INSERT INTO tbl_User 
VALUES ('yolanda1610@yahoo.com','missuTin','Pe Den','10/16/1990','false','1234 Quoc Lo 10, Q.BT','0902662034',2)
INSERT INTO tbl_User 
VALUES ('bind202@yahoo.com','121234','Trinh Thi Minh','1/2/1987','false','323 Nguyen Oanh, Q.GV','0123111222',2)
INSERT INTO tbl_User 
VALUES ('kindofme@gmail.com','miadua','Mai Huy','3/2/1989','true','23 Tran Van Canh,Q.1','0120231287',2)
INSERT INTO tbl_User 
VALUES ('mr.ken72@yahoo.com','gaogao','Ken Tigon','3/3/1985','true','124 Suong Nguyet Anh, Q.2','083423223',2)
INSERT INTO tbl_User 
VALUES ('phong2931@fpt.edu.vn','lenfen','Nguyen Phu Phong ','5/7/1983','true','23 Nguyen Van Luong, Q.4','0902132583',2)

----------------------- tbl_Event  ----------------------------------------------------------
------------------ Them Description nua ------------------------------
go 
USE NLPP_Eproject

INSERT INTO tbl_Event(Title,Fee,Description,Criteria,Procedures,StartDate,EndDate) 
	VALUES ('TestTitle1',600,'Mo ta 1 Mo ta 1 Mo ta 1 Mo ta 1','Tieu Chuan Tieu Chuan Tieu Chuan','Thu Tuc Thu Tuc Thu Tuc','1/17/2011','2/2/2011')
INSERT INTO tbl_Event(Title,Fee,Description,Criteria,Procedures,StartDate,EndDate) 
	VALUES ('TestTitle2',200,'Mo ta 2 Mo ta 2 Mo ta 2 Mo ta 2','Tieu Chuan Tieu Chuan Tieu Chuan','Thu Tuc Thu Tuc Thu Tuc','2/18/2011','3/3/2011')
INSERT INTO tbl_Event(Title,Fee,Description,Criteria,Procedures,StartDate,EndDate)  
	VALUES ('TestTitle3',300,'Mo ta 3 Mo ta 3 Mo ta 3 Mo ta 3','Tieu Chuan Tieu Chuan Tieu Chuan','Thu Tuc Thu Tuc Thu Tuc','3/15/2011','4/1/2011')
INSERT INTO tbl_Event(Title,Fee,Description,Criteria,Procedures,StartDate,EndDate)  
	VALUES ('TestTitle4',400,'Mo ta 4 Mo ta 4 Mo ta 4 Mo ta 4','Tieu Chuan Tieu Chuan Tieu Chuan','Thu Tuc Thu Tuc Thu Tuc','4/16/2011','5/3/2011')
INSERT INTO tbl_Event(Title,Fee,Description,Criteria,Procedures,StartDate,EndDate)  
	VALUES ('TestTitle5',300,'Mo ta 5 Mo ta 5 Mo ta 5 Mo ta 5','Tieu Chuan Tieu Chuan Tieu Chuan','Thu Tuc Thu Tuc Thu Tuc','5/18/2011','6/2/2011')
INSERT INTO tbl_Event(Title,Fee,Description,Criteria,Procedures,StartDate,EndDate)  
	VALUES ('TestTitle6',500,'Mo ta 6 Mo ta 6 Mo ta 6 Mo ta 6','Tieu Chuan Tieu Chuan Tieu Chuan','Thu Tuc Thu Tuc Thu Tuc','6/17/2011','6/30/2011')


------------ tbl_Payment -------------------------------------------
go
USE NLPP_Eproject
INSERT INTO tbl_Payment(Name, Description) VALUES ('Demand Draft','Mo Ta Sau')
INSERT INTO tbl_Payment(Name, Description) VALUES ('Cheque','Mo Ta Sau')
INSERT INTO tbl_Payment(Name, Description) VALUES ('Cash','Mo Ta Sau')

	
------------ tbl_EvtUser -------------------------------------------
go 
USE NLPP_Eproject

INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (1,'hotarunw@gmail.com',1)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (2,'hotarunw@gmail.com',2)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (3,'hotarunw@gmail.com',3)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (4,'hotarunw@gmail.com',1)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (6,'hotarunw@gmail.com',2)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (3,'jhenry2106@gmail.com',3)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (4,'jhenry2106@gmail.com',1)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (5,'jhenry2106@gmail.com',2)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (6,'jhenry2106@gmail.com',3)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (1,'nguoivohinh40@yahoo.com',1)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (2,'nguoivohinh40@yahoo.com',2)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (3,'nguoivohinh40@yahoo.com',3)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (4,'nguoivohinh40@yahoo.com',1)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (5,'nguoivohinh40@yahoo.com',2)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (6,'nguoivohinh40@yahoo.com',3)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (1,'yolanda1610@yahoo.com',1)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (2,'yolanda1610@yahoo.com',2)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (3,'yolanda1610@yahoo.com',3)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (5,'yolanda1610@yahoo.com',1)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (6,'yolanda1610@yahoo.com',2)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (1,'phong2931@fpt.edu.vn',3)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (2,'phong2931@fpt.edu.vn',1)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (3,'phong2931@fpt.edu.vn',2)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (4,'phong2931@fpt.edu.vn',3)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (5,'phong2931@fpt.edu.vn',1)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (6,'phong2931@fpt.edu.vn',2)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (1,'kindofme@gmail.com',3)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (2,'kindofme@gmail.com',1)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (3,'kindofme@gmail.com',2)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (4,'kindofme@gmail.com',3)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (5,'kindofme@gmail.com',1)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (6,'kindofme@gmail.com',2)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (1,'mr.ken72@yahoo.com',3)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (2,'mr.ken72@yahoo.com',1)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (3,'mr.ken72@yahoo.com',2)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (4,'mr.ken72@yahoo.com',3)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (5,'mr.ken72@yahoo.com',1)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (6,'mr.ken72@yahoo.com',2)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (1,'aphu_dudu@yahoo.com',3)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (2,'aphu_dudu@yahoo.com',1)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (3,'aphu_dudu@yahoo.com',2)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (4,'aphu_dudu@yahoo.com',3)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (5,'aphu_dudu@yahoo.com',1)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (6,'aphu_dudu@yahoo.com',2)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (1,'bingonj@gmail.com',3)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (2,'bingonj@gmail.com',1)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (3,'bingonj@gmail.com',2)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (4,'bingonj@gmail.com',3)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (5,'bingonj@gmail.com',1)
INSERT INTO tbl_EvtUser(EvtID, Email, PaymentID) VALUES (6,'bingonj@gmail.com',2)

------------------------- tbl_Presenter ----------------------------------

go
USE NLPP_Eproject

INSERT INTO tbl_Presenter(Name,Address,Email,Phone) 
	VALUES ('Nguyen Xuan Sanh','21 No Trang Long, Binh Thanh','sanh23021987@gmail.com','0938086255')
INSERT INTO tbl_Presenter(Name,Address,Email,Phone) 
	VALUES ('Nguyen Xuan Tien','453 Le Van Sy, Binh Thanh','nguyenxuantien3105@gmail.com','0938357222')
INSERT INTO tbl_Presenter(Name,Address,Email,Phone) 
	VALUES ('Doan Thi Kieu Phuong','23 Nguyen Van Dau, Tan Phu','yolandahoahongden1610@gmail.com','0902663033')
INSERT INTO tbl_Presenter(Name,Address,Email,Phone) 
	VALUES ('Kent HaiO','408 Dien Bien Phu, ','mr.kent@fpt.edu.vn','0923263535')
INSERT INTO tbl_Presenter(Name,Address,Email,Phone) 
	VALUES ('Vu Quoc Viet','23/323 Tran Phu, Binh Tan','phutran@yahoo.com','0122336365')
INSERT INTO tbl_Presenter(Name,Address,Email,Phone) 
	VALUES ('John Henry','212/21/4 Le Phu Son, Ha Dong Ha Tay','jhenry@yahoo.com','0122336365')
INSERT INTO tbl_Presenter(Name,Address,Email,Phone) 
	VALUES ('Obama Hades','232/32 Cao Son, Phu Tho','obahaha@yahoo.com','01263526521')
INSERT INTO tbl_Presenter(Name,Address,Email,Phone) 
	VALUES ('Pranav Pathak','273/23/32 Argita, Ba Ba La','pranay_pathak@yahoo.com','09921102552')
INSERT INTO tbl_Presenter(Name,Address,Email,Phone) 
	VALUES ('Monica Kumi','298/88 Devil Street, Konic City','monica@gmail.com.com','0122343846')
INSERT INTO tbl_Presenter(Name,Address,Email,Phone) 
	VALUES ('Kudo Kaido','3/2 Branch Street, Manalia','kudokito@gmail.com.com','01224876876')

------------------------tbl_EvtPresenter-----------------------------------------

go 
USE NLPP_Eproject

INSERT INTO tbl_EvtPresenter(EvtID, PreID) VALUES (1,1)
INSERT INTO tbl_EvtPresenter(EvtID, PreID) VALUES (1,2)
INSERT INTO tbl_EvtPresenter(EvtID, PreID) VALUES (2,3)
INSERT INTO tbl_EvtPresenter(EvtID, PreID) VALUES (2,4)
INSERT INTO tbl_EvtPresenter(EvtID, PreID) VALUES (3,5)
INSERT INTO tbl_EvtPresenter(EvtID, PreID) VALUES (3,6)
INSERT INTO tbl_EvtPresenter(EvtID, PreID) VALUES (4,7)
INSERT INTO tbl_EvtPresenter(EvtID, PreID) VALUES (4,8)
INSERT INTO tbl_EvtPresenter(EvtID, PreID) VALUES (5,9)
INSERT INTO tbl_EvtPresenter(EvtID, PreID) VALUES (5,10)
INSERT INTO tbl_EvtPresenter(EvtID, PreID) VALUES (6,1)
INSERT INTO tbl_EvtPresenter(EvtID, PreID) VALUES (6,3)
INSERT INTO tbl_EvtPresenter(EvtID, PreID) VALUES (6,5)


-----------------tbl_Award-------------------------------------------------------- dich tieng anh
go
USE NLPP_Eproject
INSERT INTO tbl_Award(EvtID, Description) VALUES (1,'1 Suat hoc bong 100%')
INSERT INTO tbl_Award(EvtID, Description) VALUES (1,'1 Suat hoc bong 80%')
INSERT INTO tbl_Award(EvtID, Description) VALUES (1,'1 Suat hoc bong 30%')
INSERT INTO tbl_Award(EvtID, Description) VALUES (2,'1 Suat hoc bong 100%')
INSERT INTO tbl_Award(EvtID, Description) VALUES (2,'1 Suat hoc bong 80%')
INSERT INTO tbl_Award(EvtID, Description) VALUES (2,'1 Suat hoc bong 30%')
INSERT INTO tbl_Award(EvtID, Description) VALUES (3,'1 Suat Du Lich Hawai')
INSERT INTO tbl_Award(EvtID, Description) VALUES (3,'1 Hoc bong 100%')
INSERT INTO tbl_Award(EvtID, Description) VALUES (3,'1 Usb 32Gb')
INSERT INTO tbl_Award(EvtID, Description) VALUES (4,'1 Suat hoc bong 100%')
INSERT INTO tbl_Award(EvtID, Description) VALUES (4,'1 Suat hoc bong 80%')
INSERT INTO tbl_Award(EvtID, Description) VALUES (4,'1 Suat hoc bong 30%')
INSERT INTO tbl_Award(EvtID, Description) VALUES (5,'1 Suat hoc bong 100%')
INSERT INTO tbl_Award(EvtID, Description) VALUES (5,'1 Suat hoc bong 80%')
INSERT INTO tbl_Award(EvtID, Description) VALUES (5,'1 Suat hoc bong 30%')
INSERT INTO tbl_Award(EvtID, Description) VALUES (6,'1 Suat hoc bong 100%')
INSERT INTO tbl_Award(EvtID, Description) VALUES (6,'1 Suat hoc bong 80%')
INSERT INTO tbl_Award(EvtID, Description) VALUES (6,'1 Suat hoc bong 30%')

-------------------------tbl_EvtWinner---------------------------------------------------
go
USE NLPP_Eproject

INSERT INTO tbl_EvtWinner(EvtID, Email, AwardID) VALUES (1,'hotarunw@gmail.com',1)
INSERT INTO tbl_EvtWinner(EvtID, Email, AwardID) VALUES (1,'nguoivohinh40@yahoo.com',2)
INSERT INTO tbl_EvtWinner(EvtID, Email, AwardID) VALUES (1,'yolanda1610@yahoo.com',3)
INSERT INTO tbl_EvtWinner(EvtID, Email, AwardID) VALUES (2,'phong2931@fpt.edu.vn',4)
INSERT INTO tbl_EvtWinner(EvtID, Email, AwardID) VALUES (2,'kindofme@gmail.com',5)
INSERT INTO tbl_EvtWinner(EvtID, Email, AwardID) VALUES (2,'mr.ken72@yahoo.com',6)
INSERT INTO tbl_EvtWinner(EvtID, Email, AwardID) VALUES (3,'bingonj@gmail.com',7)
INSERT INTO tbl_EvtWinner(EvtID, Email, AwardID) VALUES (3,'aphu_dudu@yahoo.com',8)
INSERT INTO tbl_EvtWinner(EvtID, Email, AwardID) VALUES (3,'hotarunw@gmail.com',9)
INSERT INTO tbl_EvtWinner(EvtID, Email, AwardID) VALUES (4,'jhenry2106@gmail.com',10)
INSERT INTO tbl_EvtWinner(EvtID, Email, AwardID) VALUES (4,'hotarunw@gmail.com',11)
INSERT INTO tbl_EvtWinner(EvtID, Email, AwardID) VALUES (4,'kindofme@gmail.com',12)
INSERT INTO tbl_EvtWinner(EvtID, Email, AwardID) VALUES (5,'yolanda1610@yahoo.com',13)
INSERT INTO tbl_EvtWinner(EvtID, Email, AwardID) VALUES (5,'mr.ken72@yahoo.com',14)
INSERT INTO tbl_EvtWinner(EvtID, Email, AwardID) VALUES (5,'phong2931@fpt.edu.vn',15)

---------------------tbl_FAQ-------------------------------------------------------

go
USE NLPP_Eproject

INSERT INTO tbl_FAQ(Subject, Question, Answer) VALUES ('Subject 1','Question 1 Question 1 Question 1','Answer 1 Answer 1 Answer 1 ')
INSERT INTO tbl_FAQ(Subject, Question, Answer) VALUES ('Subject 2','Question 2 Question 2 Question 2','Answer 2 Answer 2 Answer 2 ')
INSERT INTO tbl_FAQ(Subject, Question, Answer) VALUES ('Subject 3','Question 3 Question 3 Question 3','Answer 3 Answer 3 Answer 3 ')
INSERT INTO tbl_FAQ(Subject, Question, Answer) VALUES ('Subject 4','Question 4 Question 4 Question 4','Answer 4 Answer 4 Answer 4 ')
INSERT INTO tbl_FAQ(Subject, Question, Answer) VALUES ('Subject 5','Question 5 Question 5 Question 5','Answer 5 Answer 5 Answer 5 ')
INSERT INTO tbl_FAQ(Subject, Question, Answer) VALUES ('Subject 6','Question 6 Question 6 Question 6','Answer 6 Answer 6 Answer 6 ')
INSERT INTO tbl_FAQ(Subject, Question, Answer) VALUES ('Subject 7','Question 7 Question 7 Question 7','Answer 7 Answer 7 Answer 7 ')
INSERT INTO tbl_FAQ(Subject, Question, Answer) VALUES ('Subject 8','Question 8 Question 8 Question 8','Answer 8 Answer 8 Answer 8 ')
INSERT INTO tbl_FAQ(Subject, Question, Answer) VALUES ('Subject 9','Question 9 Question 9 Question 9','Answer 9 Answer 9 Answer 9 ')
	
----------------------tbl_FeedBack---------------------------------------------------------------
go
USE NLPP_Eproject

INSERT INTO tbl_FeedBack(Email, Subject, Question, Answer,QuestionDate,AnswerDate,Status)
	VALUES ('hotarunw@gmail.com','Subject','Question','Answer','3/3/2011','3/4/2011','Done')
INSERT INTO tbl_FeedBack(Email, Subject, Question, Answer,QuestionDate,AnswerDate,Status)
	VALUES ('jhenry2106@gmail.com','Subject','Question','Answer','4/3/2011','4/4/2011','Done')
INSERT INTO tbl_FeedBack(Email, Subject, Question, Answer,QuestionDate,AnswerDate,Status)
	VALUES ('nguoivohinh40@yahoo.com','Subject','Question','Answer','5/3/2011','5/12/2011','Done')
INSERT INTO tbl_FeedBack(Email, Subject, Question, Answer,QuestionDate,AnswerDate,Status)
	VALUES ('aphu_dudu@yahoo.com','Subject','Question','Answer','5/3/2011','5/12/2011','Done')
INSERT INTO tbl_FeedBack(Email, Subject, Question, Answer,QuestionDate,AnswerDate,Status)
	VALUES ('yolanda1610@yahoo.com','Subject','Question','Answer','3/3/2011','3/4/2011','Done')
INSERT INTO tbl_FeedBack(Email, Subject, Question, Answer,QuestionDate,AnswerDate,Status)
	VALUES ('bind202@yahoo.com','Subject','Question','Answer','3/3/2011','3/4/2011','Done')
INSERT INTO tbl_FeedBack(Email, Subject, Question, Answer,QuestionDate,AnswerDate,Status)
	VALUES ('kindofme@gmail.com','Subject','Question','Answer','3/3/2011','3/4/2011','Done')
INSERT INTO tbl_FeedBack(Email, Subject, Question, Answer,QuestionDate,AnswerDate,Status)
	VALUES ('mr.ken72@yahoo.com','Subject','Question','Answer','3/3/2011','3/4/2011','Done')
INSERT INTO tbl_FeedBack(Email, Subject, Question, Answer,QuestionDate,AnswerDate,Status)
	VALUES ('phong2931@fpt.edu.vn','Subject','Question','Answer','3/3/2011','3/4/2011','Done')