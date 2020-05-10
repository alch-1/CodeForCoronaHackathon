-- set up the database for the web app
drop database if exists health_database;
create database health_database;

-- use this database to create and populate the tables
use health_database;

CREATE TABLE `user` (
	username VARCHAR(64) PRIMARY KEY,
	fullname VARCHAR(64) NOT NULL,
    password VARCHAR(64) NOT NULL,
    # 0 --> patient 
    # 1 --> therapist
    user_type INT NOT NULL
);

CREATE TABLE `instanthelp` (
    session_id VARCHAR(255) PRIMARY KEY,
    # 0 --> unattended
    # 1 --> attended
    status_num INT NOT NULL
);

CREATE TABLE `appointment` (
    session_id VARCHAR(255) PRIMARY KEY,
    # 0 --> unattended
    # 1 --> attended
    status_num INT NOT NULL
);

CREATE TABLE `questionaire` (
  `name` TEXT,
  `details` TEXT,
  `website` TEXT,
  `operating_hours` TEXT,
  `contact_details` TEXT,
  `category` TEXT
);

INSERT INTO `user` VALUES
('ryota', 'ryota wong', 'password', 0),
('joven', 'joven heng', 'password', 0),
('benjamin', 'benjamin wong', 'password', 1),
('aldric', 'aldric chong', 'password', 1),
('belle', 'belle lee', 'password', 1);

INSERT INTO `questionaire` VALUES
('TOUCH Care Line','A helpline for eldercare and caregiving issues.','www.touch.org.sg/caregivers','9.00am – 5.00pm (except Public Holidays, eve of New Year, Chinese New Year & Christmas)','6804 6555 caregivers@touch.org.sg','Elderly'),
('Agency for Integrated Care','Centralised agency for the handling of referrals to intermediate and long–term care services.','-','Mon to Fri:  8.30am – 6.00pm  (except public holidays)','Singapore Silver Line  1800–650 6060','Elderly'),
('Hua Mei Centre for Successful Ageing','A one–stop and first–stop primary healthcare provider for the elderly.','-','Mon to Thu:  8.30am – 6.00pm  Fri: 8.30am – 5.30pm','6661–9555','Elderly'),
('Lions Befrienders','Information, referral and befriender services  for the elderly.','-','Mon to Fri:  9.00am – 6.00pm','1800–375 8600','Elderly'),
('O’Joy Care Services','Provide care services to improve mental and psychosocial health, as well as community programme for elderly.','-','Mon to Fri:  8.00am – 5.30pm','6749–0190','Elderly'),
('The Seniors Helpline  (manned by SAGE Counselling Centre)','For anyone 50 years and above or anyone who has a concern or question regarding someone 50 years and above.','-','Mon to Fri:  9.00am – 7.00pm  Sat: 9.00am – 1.00pm','1800–555 5555','Elderly'),
('Big Love (Community–based Child Protection Specialist Centre)','For a child (below 14 years of age) or a young person (from 14 to below 16 years of age) that is abused or neglected.','www.touch.org.sg/caregivers','9.00am – 5.00pm (except Public Holidays, eve of New Year, Chinese New Year & Christmas)','6804 6555 caregivers@touch.org.sg','Children / Child Protection'),
('HEART @ Fei Yue (Community–based Child Protection Specialist Centre)','For a child (below 14 years of age) or a young person (from 14 to below 16 years of age) that is abused or neglected.','-','Mon to Fri: 9.30am – 5.30pm','6819–9170 heartadmin@fycs.org','Children / Child Protection'),
('MSF Child Protective Service','For a child (below 14 years of age) or a young person (from 14 to below 16 years of age) that is abused or neglected.','-','Mon to Fri: 8.30am – 5.30pm Sat: 8.30am – 1.00pm','1800–777 0000','Children / Child Protection'),
('SAFE SPACE (Community–based Child Protection Specialist Centre)','For a child (below 14 years of age) or a young person (from 14 to below 16 years of age) that is abused or neglected.','-','Mon to Fri:9.00am – 1.00pm  2.00pm – 6.00pm','6266–0171','Children / Child Protection'),
('eCounselling Centre (eC2) (Fei Yue Project 180)','An online facility offering free counselling to youths.','www.ec2.sg','Mon to Fri: 2.00pm – 5.30pm','Fei Yue Community Services admin@ec2.sg','Youth'),
('Help123 Cyber Wellness Community Support','A one–stop platform to address cyber wellness concerns faced by youths, parents or educators. Users can get relevant information on cyber issues and interact with trained counsellors through web chat or phone.','https://www.help123.sg/','Mon to Fri: 10.00am – 6.00pm (except public holidays): Chat Online at: www.help123.sg Mon to Fri: 2.00pm – 10.00pm (except public holidays)','1800–612 3123 hello@help123.sg','Youth'),
('MeToYou Cyber Care (a programme by Montfort Care @27 FSC)','MeToYou Cyber Care is a cyber–wellness programme for youths aged 12 to 18 years old.','-','Mon to Fri: 9.00am – 6.00pm','6270–8327 / 9173–1766','Youth'),
('Tinkle Friend Helpline (manned by Singapore Children’s Society)','A national toll free helpline and chatline for all primary–school–aged children in Singapore. It provides support, advice and information to lonely and distressed children, especially in situations when their parents or main caregivers are unavailable.','www.tinklefriend.com','Mon to Fri: 2.30pm – 5.00pm Online Chat: Mon to Fri: 2:30pm - 5:30pm Wed 6:30pm - 8:30pm','1800–274 4788','Youth'),
('TOUCHline/ (TOUCH Youth)  ','A helpline for youth-related issues. It is manned by TOUCH Youth’s team of counsellors who provide cyber wellness/ youth-related information or advice to both parents and youths.','-','Mon to Fri 9am – 6pm, except Public Holidays, eve of New Year, Chinese New Year & Christmas','1800–377 2252 cyberwellness@touch.org.sg','Youth'),
('Assistline/Brahm Centre','Provide support for youth who are struggling emotionally and parents who need support in better parenting and communication strategies.','-','(Mondays to Fridays from 9am to 6pm)        8823 0000 (whatsapp for after hours)','6655 0000','Youth'),
('SG Enable','Information and referral services for persons with disabilities (child and adult).','-','Mon to Fri:  8.30am – 6.00pm  Sat: 8.30am – 12.30pm','1800–858 5885','Disability Services'),
('Institute of Mental Health','Open to public who come into contact with individuals who are experiencing any mental health crisis.','-','24 hrs','Tel: 6389 2222 (24 hours)','Suicide Prevention'),
('Samaritans of Singapore','Provide emotional support for individuals having difficulty coping during a crisis, thinking of suicide or affected by suicide.','-','24 hrs','Tel: 1800-221 4444 (24 hours) Email:pat@sos.org.sg','Suicide Prevention'),
('Singapore Association of Mental Health','Provide information and assistance on mental health matters and psychosocial issues.','-','(Mondays to Fridays from 9am to 6pm, except public holidays)','Tel: 1800-283 7019','Emotional Counselling'),
('Clarity Singapore Limited','Provide emotional support for individuals experiencing stress, anxiety, anger and depression.','-','(Mondays and Fridays from 8.30am to 5.30pm, Tuesdays to Thursdays from 9am to 6pm, Saturdays from 9am to 4pm)','Tel: 6757 7990','Emotional Counselling'),
('Support for Wellness Achievement Programme (SWAP) Hotline/Institute of Mental Health','Provide emotional support for individuals experiencing or at-risk of developing psychosis or other mental illnesses.','-','(Mondays to Fridays from 9am to 5pm)','Tel: 6389 2972 / 9017 8212','Emotional Counselling'),
('Addicitons Helpline/WE CARE Community Services','Provide assistance to individuals struggling with an addictive disorder.','-','(Mondays to Fridays from 8.30am to 9pm and Saturdays from 10am to 8pm)','Tel: 6547 5459','Addiction'),
('National Addictions Management Service','Provide a range of services to assist individuals who are dealing with addiction problems.','-','24 hrs','Tel: 6-RECOVER (6-7326837)','Addiction'),
('TOUCH Community Services and Fei Yue Community Services','Provide basic counselling and relevant information for young people, parents, caregivers and educators on cyber wellness related issues.','-','Mondays to Fridays from 10am to 6pm)','Tel: 1800-6123 123','Addiction'),
('TOUCH Community Services and Fei Yue Community Services','Webchat is also available at https://www.help123.sg/','-','Webchat is available on Mondays to Fridays from 2pm to 10pm','https://www.help123.sg/','Addiction'),
('talk2SANA/Singapore Anti-Narcotics Association','Live chat: Open to public to talk about any drug-related issues. All chats are anonymous and confidential, and no sign up is required.','-','6pm to 9.30pm on Mondays to Fridays.','http://talk2sana.com/tools-for-change/live-chat/','Addiction'),
('TOUCHLine/TOUCH Community Services','Provide emotional support and practical advice for ages 12 to 25 years old on gaming addiction, Internet-related issues and information on youth programmes.','-','(Mondays to Fridays from 9am to 6pm, excluding Public Holidays and eve of Christmas, New Year’s Day and Chinese New Year)','Tel: 1800 377 2252','Addiction'),
('AWARE Helpline (Association of Women for Action and Research)','For women facing issues.','-','Mon to Fri:  10.00am – 6.00pm','1800-777-5555','Women'),
('Men–in–Crisis Helpline  (ADAM Association)','For men facing issues.','-','Mon to Fri:  12.00pm – 8.00pm','1800–626 2626','Men'),
('Humanitarian Organisation for Migration Economics (HOME)','For migration workers or domestic workers who are abused and exploited.','-','Daily:  10.00am – 6.30pm','1800–797 7977 /  6341–5535','Migrant Worker'),
('Care Corner Project StART','For families facing violence in need of counselling and support services.','-','Mon to Fri:  10.00am – 5.00pm','6476–1482','Violence / Abuse'),
('PAVE','For families facing violence in need of counselling and support services.','-','Mon to Fri:  9.00am – 6.00pm  Wed: 9.00am – 6.00pm','6555–0390','Violence / Abuse'),
('TRANS SAFE Centre','For families facing violence in need of counselling and support services.','-','Mon to Fri:  9.00am – 5.00pm','6449–9088','Violence / Abuse');