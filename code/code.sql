-- Create Table

CREATE TABLE Dataset(
dataset_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
name varchar(30) NOT NULL,
address varchar(30) NOT NULL,
email varchar(30) NOT NULL,
phone int
);

-- Create Table with Foreign Key

CREATE TABLE Students(
student_id int  NOT NULL AUTO_INCREMENT PRIMARY KEY,
FK_dataset_id int,
FOREIGN KEY (FK_dataset_id) REFERENCES Dataset(dataset_id)
)
