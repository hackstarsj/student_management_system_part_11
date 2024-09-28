-- Populate auth_group
INSERT INTO `auth_group` (`name`) VALUES 
('Administrators'), 
('Teachers'), 
('Students'), 
('Staff');

-- Populate auth_permission
INSERT INTO `auth_permission` (`name`, `content_type_id`, `codename`) VALUES 
('Can add assignment', 8, 'add_assignment'), 
('Can change assignment', 8, 'change_assignment'), 
('Can delete assignment', 8, 'delete_assignment'), 
('Can view assignment', 8, 'view_assignment'), 
('Can add grade', 8, 'add_grade'), 
('Can change grade', 8, 'change_grade'), 
('Can delete grade', 8, 'delete_grade'), 
('Can view grade', 8, 'view_grade');

-- Populate auth_group_permissions
INSERT INTO `auth_group_permissions` (`group_id`, `permission_id`) VALUES 
(1, 1),  
(1, 2),  
(1, 3),  
(2, 1),  
(2, 2),  
(2, 4);  

-- Populate django_admin_log
INSERT INTO `django_admin_log` (`action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES 
(NOW(), '1', 'Assignment 1', 1, 'Created Assignment 1', 8, 1), 
(NOW(), '2', 'Assignment 1', 2, 'Updated Assignment 1', 8, 2), 
(NOW(), '3', 'Assignment 2', 3, 'Deleted Assignment 2', 8, 1);

-- Populate django_content_type
INSERT INTO `django_content_type` (`app_label`, `model`) VALUES 
('student_management_app', 'assignment'), 
('student_management_app', 'grade');

-- Populate django_migrations
INSERT INTO `django_migrations` (`app`, `name`, `applied`) VALUES 
('student_management_app', '0005_auto_create_assignments', NOW());

-- Populate django_session
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES 
('session1', 'data_for_session_1', NOW() + INTERVAL 1 HOUR), 
('session2', 'data_for_session_2', NOW() + INTERVAL 1 HOUR);

-- Populate student_management_app_adminhod
INSERT INTO `student_management_app_adminhod` (`created_at`, `updated_at`, `admin_id`) VALUES 
(NOW(), NOW(), 1);

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4uafupyvuwgg8hsxkrbyvr6dr5flanz0','MTkxMzk4ODg5ZjE2ZmJmNzFiYzU4ZDYzYTZmNjU5NzE1ZTY1ZGFkODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoic3R1ZGVudF9tYW5hZ2VtZW50X2FwcC5FbWFpbEJhY2tFbmQuRW1haWxCYWNrRW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWI2YTk5ZjEwMzM0MDdjYmE0NmZjZGZlZDEyZGM5NzhhOTM3Y2JmMyJ9','2020-06-09 08:15:00.200912'),('z25qqlq023k6i2veud817qctrlxk63fn','MTkxMzk4ODg5ZjE2ZmJmNzFiYzU4ZDYzYTZmNjU5NzE1ZTY1ZGFkODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoic3R1ZGVudF9tYW5hZ2VtZW50X2FwcC5FbWFpbEJhY2tFbmQuRW1haWxCYWNrRW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWI2YTk5ZjEwMzM0MDdjYmE0NmZjZGZlZDEyZGM5NzhhOTM3Y2JmMyJ9','2020-05-24 14:09:45.204277');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `student_management_app_adminhod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_management_app_adminhod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `admin_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_id` (`admin_id`),
  CONSTRAINT `student_management_a_admin_id_2d75304f_fk_student_m` FOREIGN KEY (`admin_id`) REFERENCES `student_management_app_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `student_management_app_adminhod` WRITE;
/*!40000 ALTER TABLE `student_management_app_adminhod` DISABLE KEYS */;
INSERT INTO `student_management_app_adminhod` VALUES (1,'2020-04-12 08:16:07.103523','2020-04-12 08:16:07.103523',1);
/*!40000 ALTER TABLE `student_management_app_adminhod` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `student_management_app_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_management_app_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attendance_date` date NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `session_year_id_id` int(11) NOT NULL,
  `subject_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_management_a_session_year_id_id_0d30545d_fk_student_m` (`session_year_id_id`),
  KEY `student_management_a_subject_id_id_9ae82fd0_fk_student_m` (`subject_id_id`),
  CONSTRAINT `student_management_a_session_year_id_id_0d30545d_fk_student_m` FOREIGN KEY (`session_year_id_id`) REFERENCES `student_management_app_sessionyearmodel` (`id`),
  CONSTRAINT `student_management_a_subject_id_id_9ae82fd0_fk_student_m` FOREIGN KEY (`subject_id_id`) REFERENCES `student_management_app_subjects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `student_management_app_attendance` WRITE;
/*!40000 ALTER TABLE `student_management_app_attendance` DISABLE KEYS */;
INSERT INTO `student_management_app_attendance` VALUES (4,'2020-04-12','2020-04-12 11:49:25.282944','2020-04-12 11:49:25.282944',1,1),(5,'2020-04-12','2020-04-12 11:49:51.034169','2020-04-12 11:49:51.034169',1,2),(6,'2020-05-07','2020-05-07 14:19:12.327810','2020-05-07 14:19:12.327810',1,1),(7,'2020-05-07','2020-05-07 14:19:25.800828','2020-05-07 14:19:25.800828',1,1),(8,'2020-05-07','2020-05-07 14:19:45.100649','2020-05-07 14:19:45.100649',1,1),(9,'2020-05-07','2020-05-07 14:28:08.882707','2020-05-07 14:28:08.882707',2,2),(10,'2020-05-07','2020-05-07 08:58:38.167460','2020-05-07 08:58:38.168149',2,2),(11,'2020-05-07','2020-05-07 08:59:15.875971','2020-05-07 08:59:15.875971',1,1),(12,'2020-05-07','2020-05-07 08:59:15.887974','2020-05-07 08:59:15.887974',1,1),(13,'2020-05-10','2020-05-07 09:00:59.318549','2020-05-07 09:00:59.318549',1,1),(14,'2020-05-17','2020-05-07 14:31:31.654667','2020-05-07 14:31:31.654667',1,1),(15,'2020-05-10','2020-05-07 14:39:11.790480','2020-05-07 14:39:11.790480',1,2),(16,'2020-05-15','2020-05-10 14:10:11.214771','2020-05-10 14:10:11.214771',1,1);
/*!40000 ALTER TABLE `student_management_app_attendance` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `student_management_app_attendancereport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_management_app_attendancereport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `attendance_id_id` int(11) NOT NULL,
  `student_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_management_a_attendance_id_id_f765f2a1_fk_student_m` (`attendance_id_id`),
  KEY `student_management_a_student_id_id_5a58ceea_fk_student_m` (`student_id_id`),
  CONSTRAINT `student_management_a_attendance_id_id_f765f2a1_fk_student_m` FOREIGN KEY (`attendance_id_id`) REFERENCES `student_management_app_attendance` (`id`),
  CONSTRAINT `student_management_a_student_id_id_5a58ceea_fk_student_m` FOREIGN KEY (`student_id_id`) REFERENCES `student_management_app_students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `student_management_app_attendancereport` WRITE;
/*!40000 ALTER TABLE `student_management_app_attendancereport` DISABLE KEYS */;
INSERT INTO `student_management_app_attendancereport` VALUES (1,1,'2020-04-12 08:19:48.252429','2020-04-12 08:19:48.252429',1,1),(2,1,'2020-04-12 08:19:48.267247','2020-04-12 08:19:48.267247',1,1),(3,0,'2020-04-12 08:19:48.269571','2020-04-12 08:19:48.269571',1,2),(4,1,'2020-04-12 08:19:48.271827','2020-04-12 08:19:48.271827',1,2),(5,1,'2020-04-12 08:19:48.273431','2020-04-12 08:19:48.273431',1,2),(6,0,'2020-04-12 08:19:48.274728','2020-04-12 08:19:48.274728',1,2),(7,1,'2020-04-12 08:19:48.276536','2020-04-12 08:19:48.276536',1,1),(8,0,'2020-04-12 08:19:48.278433','2020-04-12 08:19:48.278433',1,1),(9,1,'2020-04-12 08:19:48.280232','2020-04-12 08:19:48.280232',1,2),(10,0,'2020-04-12 08:19:48.281922','2020-04-12 08:19:48.281922',1,1),(11,1,'2020-04-12 08:19:48.283748','2020-04-12 08:19:48.283748',1,1),(12,1,'2020-04-12 08:19:48.285314','2020-04-12 08:19:48.285314',1,1),(13,0,'2020-04-12 08:19:48.286824','2020-04-12 08:19:48.286824',1,1),(14,1,'2020-04-12 08:19:48.288703','2020-04-12 08:19:48.288703',1,1),(15,1,'2020-04-12 08:19:48.290473','2020-04-12 08:19:48.290473',1,2),(16,0,'2020-04-12 08:19:48.291794','2020-04-12 08:19:48.291794',1,2),(17,1,'2020-04-12 08:19:48.293078','2020-04-12 08:19:48.293078',1,1),(18,0,'2020-04-12 08:19:48.294473','2020-04-12 08:19:48.294473',1,2),(19,0,'2020-04-12 08:19:48.295741','2020-04-12 08:19:48.295741',1,1),(20,1,'2020-04-12 08:19:48.297034','2020-04-12 08:19:48.297034',1,2),(21,0,'2020-04-12 08:19:48.298300','2020-04-12 08:19:48.298300',1,2),(22,1,'2020-04-12 08:19:48.299565','2020-04-12 08:19:48.299565',1,1),(23,1,'2020-04-12 08:19:48.300832','2020-04-12 08:19:48.300832',1,1),(24,1,'2020-04-12 08:19:48.302091','2020-04-12 08:19:48.302091',1,2),(25,0,'2020-04-12 08:19:48.303348','2020-04-12 08:19:48.303348',1,1);
/*!40000 ALTER TABLE `student_management_app_attendancereport` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `student_management_app_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_management_app_customuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_hod` tinyint(1) NOT NULL,
  `is_student` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `student_management_app_customuser` WRITE;
/*!40000 ALTER TABLE `student_management_app_customuser` DISABLE KEYS */;
INSERT INTO `student_management_app_customuser` VALUES (1,'admin@admin.com','admin','$2b$12$1Kf6gRfKzJRMuvtmBDFLkeFCk3An.Cc4ZbtrM0CUGaW6YwCglay0K','1','1','1','0','2020-04-12 08:13:45.088030','2020-04-12 08:13:45.088030',NULL,'1');
/*!40000 ALTER TABLE `student_management_app_customuser` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `student_management_app_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_management_app_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(200) NOT NULL,
  `total_marks` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `session_year_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_management_a_session_year_id_id_340b1bd2_fk_student_m` (`session_year_id_id`),
  CONSTRAINT `student_management_a_session_year_id_id_340b1bd2_fk_student_m` FOREIGN KEY (`session_year_id_id`) REFERENCES `student_management_app_sessionyearmodel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `student_management_app_exam` WRITE;
/*!40000 ALTER TABLE `student_management_app_exam` DISABLE KEYS */;
INSERT INTO `student_management_app_exam` VALUES (1,'Internal Exam 1',100,'2020-04-12 11:48:34.068319','2020-04-12 11:48:34.068319',1);
/*!40000 ALTER TABLE `student_management_app_exam` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `student_management_app_examreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_management_app_examreport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marks` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `exam_id_id` int(11) NOT NULL,
  `student_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_management_a_exam_id_id_faa8d067_fk_student_m` (`exam_id_id`),
  KEY `student_management_a_student_id_id_a75e0a01_fk_student_m` (`student_id_id`),
  CONSTRAINT `student_management_a_exam_id_id_faa8d067_fk_student_m` FOREIGN

