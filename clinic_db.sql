-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2025 at 07:22 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinic_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(500) NOT NULL,
  `loginid` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(500) NOT NULL,
  `gender` varchar(500) NOT NULL,
  `dob` text NOT NULL,
  `mobileno` text NOT NULL,
  `addr` varchar(500) NOT NULL,
  `notes` varchar(200) NOT NULL,
  `image` varchar(2000) NOT NULL,
  `created_on` date NOT NULL,
  `updated_on` date NOT NULL,
  `role_id` int(11) NOT NULL,
  `last_login` date NOT NULL,
  `delete_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `loginid`, `password`, `fname`, `lname`, `gender`, `dob`, `mobileno`, `addr`, `notes`, `image`, `created_on`, `updated_on`, `role_id`, `last_login`, `delete_status`) VALUES
(1, 'admin', 'Andalis@gmail.com', 'aa7f019c326413d5b8bcad4314228bcd33ef557f5d81c7cc977f7728156f4357', 'Ronald Francis Andalis', 'admin', 'Male', '2018-11-26', '9669809970', '<p>San Isidro, Bula, Camarines Sur, Philippines</p>\r\n', '<p>admin panel</p>\r\n', 'profile.jpg', '2018-04-30', '2019-10-15', 1, '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointmentid` int(10) NOT NULL,
  `appointmenttype` varchar(25) NOT NULL,
  `patientid` int(10) NOT NULL,
  `roomid` int(10) NOT NULL,
  `departmentid` int(10) NOT NULL,
  `appointmentdate` date NOT NULL,
  `appointmenttime` time NOT NULL,
  `doctorid` int(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `app_reason` text NOT NULL,
  `delete_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointmentid`, `appointmenttype`, `patientid`, `roomid`, `departmentid`, `appointmentdate`, `appointmenttime`, `doctorid`, `status`, `app_reason`, `delete_status`) VALUES
(13, '', 7, 0, 6, '2025-05-13', '06:23:00', 6, 'Approved', 'may cancer sa ulo', 0),
(14, '', 6, 0, 6, '2025-05-21', '07:23:00', 6, 'Approved', 'may bali sa noo', 0);

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `billingid` int(10) NOT NULL,
  `patientid` int(10) DEFAULT NULL,
  `appointmentid` int(10) DEFAULT NULL,
  `billingdate` date DEFAULT NULL,
  `billingtime` time DEFAULT NULL,
  `discount` float(10,2) DEFAULT NULL,
  `taxamount` float(10,2) DEFAULT NULL,
  `discountreason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `billing`
--

INSERT INTO `billing` (`billingid`, `patientid`, `appointmentid`, `billingdate`, `billingtime`, `discount`, `taxamount`, `discountreason`) VALUES
(48, 5, 10, '2020-12-11', '21:31:14', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `billing_records`
--

CREATE TABLE `billing_records` (
  `billingservice_id` int(10) NOT NULL,
  `bill_type_id` int(10) DEFAULT NULL COMMENT 'id of service charge or treatment charge',
  `bill_type` varchar(256) DEFAULT NULL,
  `bill_amount` float(10,2) DEFAULT NULL,
  `bill_date` date DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `billingid` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `billing_records`
--

INSERT INTO `billing_records` (`billingservice_id`, `bill_type_id`, `bill_type`, `bill_amount`, `bill_date`, `status`, `billingid`) VALUES
(16, 1, 'Consultancy Charge', 250.00, '2020-12-11', 'Active', 48),
(17, 1, 'Consultancy Charge', 250.00, '2020-12-11', 'Active', 48),
(18, 1, 'Consultancy Charge', 250.00, '2020-12-11', 'Active', 48);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `departmentid` int(10) NOT NULL,
  `departmentname` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL,
  `delete_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentid`, `departmentname`, `description`, `status`, `delete_status`) VALUES
(3, 'General Medicine', 'Provides diagnosis and treatment for common illnesses, chronic conditions, and preventive care. Ideal for patients needing initial assessment or ongoing management of health issues like hypertension, diabetes, and infections.', 'Active', 0),
(4, 'Dermatology', 'Specializes in skin, hair, and nail conditions such as acne, eczema, rashes, fungal infections, and minor dermatologic procedures.', 'Active', 0),
(5, 'Cardiology', 'Provides screening, diagnosis, and treatment for heart and vascular conditions. Services may include ECGs, blood pressure monitoring, and heart health consultations.', 'Inactive', 0),
(6, 'Minor Surgery', 'Handles small surgical procedures that do not require hospital admission, such as wound suturing, mole removal, abscess drainage, and biopsy collection.', 'Active', 0),
(7, 'Laboratory Services', 'Conducts diagnostic tests including blood work, urinalysis, and other screenings to support medical evaluations.', 'Active', 0),
(8, 'Neurology', 'Focuses on disorders of the nervous system. Common concerns include headaches, seizures, neuropathies, and coordination issues.', 'Active', 0);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctorid` int(10) NOT NULL,
  `doctorname` varchar(50) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `departmentid` int(10) NOT NULL,
  `loginid` varchar(25) NOT NULL,
  `password` text NOT NULL,
  `status` varchar(10) NOT NULL,
  `education` varchar(25) NOT NULL,
  `experience` float(11,1) NOT NULL,
  `consultancy_charge` float(10,2) NOT NULL,
  `delete_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctorid`, `doctorname`, `mobileno`, `departmentid`, `loginid`, `password`, `status`, `education`, `experience`, `consultancy_charge`, `delete_status`) VALUES
(6, 'Dr. Kathleen Sendon', '09171234567', 6, 'sendon@gmail.com', '5fc5e6009c3c56f7873d1cfd72095dab2804bfb8b46477d5db40309a793e49e6', 'Active', 'Bachelor of Science in Nu', 5.0, 0.00, 0);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_timings`
--

CREATE TABLE `doctor_timings` (
  `doctor_timings_id` int(10) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `available_day` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL,
  `delete_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doctor_timings`
--

INSERT INTO `doctor_timings` (`doctor_timings_id`, `doctorid`, `start_time`, `end_time`, `available_day`, `status`, `delete_status`) VALUES
(1, 1, '09:00:00', '12:00:00', '', 'Active', 0),
(2, 6, '01:27:00', '19:27:00', '', 'Active', 0);

-- --------------------------------------------------------

--
-- Table structure for table `lifestyle`
--

CREATE TABLE `lifestyle` (
  `lifestyle_id` int(10) NOT NULL,
  `prescription_id` int(10) DEFAULT NULL,
  `review_with` varchar(256) DEFAULT NULL,
  `next_review_on` date DEFAULT NULL,
  `message` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `lifestyle`
--

INSERT INTO `lifestyle` (`lifestyle_id`, `prescription_id`, `review_with`, `next_review_on`, `message`) VALUES
(3, 2, 'RT-PCR', '2020-12-21', 'Prescription to be followed and to be reported on next review date.'),
(7, 10, '', '0000-00-00', 'Prescription to be followed and to be reported on next review date.');

-- --------------------------------------------------------

--
-- Table structure for table `manage_website`
--

CREATE TABLE `manage_website` (
  `id` int(11) NOT NULL,
  `business_name` varchar(600) NOT NULL,
  `business_email` varchar(600) NOT NULL,
  `business_web` varchar(500) NOT NULL,
  `portal_addr` varchar(500) NOT NULL,
  `addr` varchar(600) NOT NULL,
  `curr_sym` varchar(600) NOT NULL,
  `curr_position` varchar(500) NOT NULL,
  `front_end_en` varchar(500) NOT NULL,
  `date_format` date NOT NULL,
  `def_tax` varchar(500) NOT NULL,
  `logo` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `manage_website`
--

INSERT INTO `manage_website` (`id`, `business_name`, `business_email`, `business_web`, `portal_addr`, `addr`, `curr_sym`, `curr_position`, `front_end_en`, `date_format`, `def_tax`, `logo`) VALUES
(1, 'Polyclinic', 'polyclinic@gmail.com', 'www.polyclinic.com', '#', 'Nabua, Camarines Sur, Philippines', 'peso', 'right', '0', '0000-00-00', '5.0', 'logo for hospital system.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `medicineid` int(10) NOT NULL,
  `medicinename` varchar(25) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL,
  `delete_status` int(11) NOT NULL,
  `medicinetype` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`medicineid`, `medicinename`, `description`, `status`, `delete_status`, `medicinetype`) VALUES
(8, 'Bioflu', 'An over-the-counter tablet used for the relief of cold symptoms such as fever, headache, runny nose, and body pain. Often used for flu-like symptoms.\r\n', 'Active', 0, 'Tablet'),
(9, 'Neozep Forte	', 'A multi-symptom cold medicine in capsule form that provides relief from nasal congestion, headache, and sneezing. Commonly taken for the common cold.\r\n', 'Active', 0, 'Capsule'),
(10, 'Tempra', 'A paracetamol-based syrup for children used to treat fever and mild to moderate pain. It has a pleasant flavor for easier ingestion.\r\n', 'Active', 0, 'Syrup'),
(11, 'Salinase', 'A saline nasal drop used for infants and young children to relieve nasal congestion and dry nasal passages.\r\n', 'Active', 0, 'Drop'),
(12, 'Ventolin', 'A bronchodilator inhaler containing salbutamol, used for the quick relief of asthma symptoms and other breathing difficulties.\r\n\r\n', 'Active', 0, 'Inhaler'),
(13, 'Clexane 40mg	', 'An anticoagulant (blood thinner) used to prevent and treat blood clots, especially after surgery or in bedridden patients. Administered subcutaneously.\r\n', 'Active', 0, 'Injection'),
(14, 'Elidel Cream 1%	', 'A topical treatment used for mild to moderate eczema (atopic dermatitis). It reduces inflammation and immune responses in affected skin areas.\r\n\r\n', 'Active', 0, 'Gel');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `prescriptionid` int(10) NOT NULL,
  `orderdate` date NOT NULL,
  `deliverydate` date NOT NULL,
  `address` text NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `note` text NOT NULL,
  `status` varchar(10) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `card_no` varchar(20) NOT NULL,
  `cvv_no` varchar(5) NOT NULL,
  `expdate` date NOT NULL,
  `card_holder` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientid` int(10) NOT NULL,
  `patientname` varchar(50) NOT NULL,
  `admissiondate` date NOT NULL,
  `admissiontime` time NOT NULL,
  `address` varchar(250) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `city` varchar(25) NOT NULL,
  `pincode` varchar(20) NOT NULL,
  `loginid` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `bloodgroup` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `delete_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientid`, `patientname`, `admissiondate`, `admissiontime`, `address`, `mobileno`, `city`, `pincode`, `loginid`, `password`, `bloodgroup`, `gender`, `dob`, `status`, `delete_status`) VALUES
(6, 'Erika Valenzuela', '2025-05-07', '15:49:00', 'St. Rosa, Naga, Camarines Sur.', '09999876543', 'Naga City', '570019', 'erika@gmail.com', 'ceeec1123727fcb72a1a2a5ba3af12ea68a78bba0788a8dccbe56fea837a4e66', 'B+', 'Female', '2011-02-16', 'Active', 0),
(7, 'Crisia Carullo', '2025-05-21', '22:03:00', 'San Isidro, Iriga, Camarines Sur', '0981234567', 'Iriga', '470879', 'crisia@gmail.com', 'a12126f3c47390e25657157c24f031ac051b765e243f4804b8c2542b0e70750b', 'AB+', 'Female', '2006-02-13', 'Active', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `appointmentid` int(10) NOT NULL,
  `paiddate` date NOT NULL,
  `paidtime` time NOT NULL,
  `paidamount` float(10,2) NOT NULL,
  `status` varchar(10) NOT NULL,
  `cardholder` varchar(50) NOT NULL,
  `cardnumber` int(25) NOT NULL,
  `cvvno` int(5) NOT NULL,
  `expdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentid`, `patientid`, `appointmentid`, `paiddate`, `paidtime`, `paidamount`, `status`, `cardholder`, `cardnumber`, `cvvno`, `expdate`) VALUES
(0, 5, 10, '0000-00-00', '00:00:00', 0.00, 'Active', '', 0, 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `prescriptionid` int(10) NOT NULL,
  `doctorid` int(10) DEFAULT NULL,
  `patientid` int(10) DEFAULT NULL,
  `delivery_type` varchar(256) DEFAULT NULL COMMENT 'Delivered through appointment or online order',
  `delivery_id` int(10) DEFAULT NULL COMMENT 'appointmentid or orderid',
  `prescriptiondate` date DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `appointmentid` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`prescriptionid`, `doctorid`, `patientid`, `delivery_type`, `delivery_id`, `prescriptiondate`, `status`, `appointmentid`) VALUES
(2, 1, 5, 'Delivered through appointment', 8, '2020-12-10', 'Active', 8),
(10, 1, 1, 'Delivered through appointment', 9, '2020-12-11', 'Active', 9),
(11, 1, 5, 'Delivered through appointment', 10, '2020-12-11', 'Active', 10),
(12, 1, 5, 'Delivered through appointment', 10, '2020-12-24', 'Active', 10);

-- --------------------------------------------------------

--
-- Table structure for table `prescription_records`
--

CREATE TABLE `prescription_records` (
  `prescription_record_id` int(10) NOT NULL,
  `prescription_id` int(10) DEFAULT NULL,
  `medicine_name` varchar(256) DEFAULT NULL,
  `unit` int(10) DEFAULT NULL,
  `dosage` varchar(25) DEFAULT NULL,
  `instruction` varchar(255) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `prescription_records`
--

INSERT INTO `prescription_records` (`prescription_record_id`, `prescription_id`, `medicine_name`, `unit`, `dosage`, `instruction`, `status`) VALUES
(21, 2, 'Dolo 650 (Tablet)', 10, '1-0-1', 'After Food', 'Active'),
(22, 2, 'Cofsils (Syrup)', 1, '1-0-1', 'After Food', 'Active'),
(23, 2, 'Ciplox (Drop)', 1, '', 'When required', 'Active'),
(24, 10, 'Dolo 650 (Tablet)', 10, '1-0-1', 'After Food', 'Active'),
(25, 10, 'Cofsils (Syrup)', 1, '1-0-1', 'After Food', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `roomid` int(10) NOT NULL,
  `roomtype` varchar(25) NOT NULL,
  `roomno` int(10) NOT NULL,
  `noofbeds` int(10) NOT NULL,
  `room_tariff` float(10,2) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`roomid`, `roomtype`, `roomno`, `noofbeds`, `room_tariff`, `status`) VALUES
(15, 'GENERAL WARD', 1, 20, 500.00, 'Active'),
(16, 'SPECIAL WARD', 2, 10, 100.00, 'Active'),
(17, 'GENERAL WARD', 2, 10, 500.00, 'Active'),
(18, 'GENERAL WARD', 121, 13, 150.00, 'Active'),
(19, 'GENERAL WARD', 850, 11, 500.00, 'Active'),
(15, 'GENERAL WARD', 1, 20, 500.00, 'Active'),
(16, 'SPECIAL WARD', 2, 10, 100.00, 'Active'),
(17, 'GENERAL WARD', 2, 10, 500.00, 'Active'),
(18, 'GENERAL WARD', 121, 13, 150.00, 'Active'),
(19, 'GENERAL WARD', 850, 11, 500.00, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `service_type`
--

CREATE TABLE `service_type` (
  `service_type_id` int(11) NOT NULL,
  `service_type` varchar(100) DEFAULT NULL,
  `servicecharge` float(10,2) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `delete_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `service_type`
--

INSERT INTO `service_type` (`service_type_id`, `service_type`, `servicecharge`, `description`, `status`, `delete_status`) VALUES
(1, 'Dr. Hegde - Consultancy', 300.00, 'Consultancy Fee', 'Active', 1),
(2, 'Prescription', 50.00, 'Prescription Charge', 'Active', 1),
(3, 'Service Charge', 20.00, 'Service Charge', 'Active', 1),
(4, 'General Consultation	', 500.00, 'A basic consultation with a general physician for assessment of common symptoms, health advice, and treatment planning. Ideal for colds, cough, fever, fatigue, and health check-ups.', 'Active', 0),
(5, 'Pediatric Check-up	', 600.00, 'A medical consultation tailored for children, including developmental monitoring, nutrition counseling, and treatment of pediatric conditions.', 'Active', 0),
(6, 'OB-GYN Pap Smear	', 1200.00, 'A screening test performed by an OB-GYN specialist to detect cervical cancer and other abnormalities in the female reproductive system.', 'Active', 0),
(7, 'Minor Surgical Procedure	', 2500.00, 'Covers small outpatient procedures such as mole removal, cyst excision, or wound suturing. Performed under local anesthesia.\r\n', 'Active', 0),
(8, 'Chest X-ray (Imaging)	', 700.00, 'A diagnostic imaging service used to evaluate the lungs, heart, and chest wall. Often required for pre-employment or routine health screening.\r\n\r\n', 'Inactive', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_email_config`
--

CREATE TABLE `tbl_email_config` (
  `e_id` int(21) NOT NULL,
  `name` varchar(500) NOT NULL,
  `mail_driver_host` varchar(5000) NOT NULL,
  `mail_port` int(50) NOT NULL,
  `mail_username` varchar(50) NOT NULL,
  `mail_password` varchar(30) NOT NULL,
  `mail_encrypt` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_permission`
--

CREATE TABLE `tbl_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `display_name` varchar(200) NOT NULL,
  `operation` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_permission`
--

INSERT INTO `tbl_permission` (`id`, `name`, `display_name`, `operation`) VALUES
(1, 'repairs', 'Repairs', 'repairs'),
(2, 'create_repair', 'Create Repair	', 'create_repair	'),
(3, 'edit_repair', 'Edit Repair', 'edit_repair'),
(4, 'delete_repair', 'Delete Repair', 'delete_repair'),
(5, 'manage_category', 'Manage Category', 'manage_category'),
(6, 'sales', 'Sales', 'sales'),
(7, 'invoices', 'Invoices', 'invoices'),
(8, 'edit_invoice', 'Edit Invoice', 'edit_invoice'),
(9, 'add_payment', 'Add Payment', 'add_payment'),
(10, 'custom_reports', 'Custom Reports', 'custom_reports'),
(11, 'financial_overview', 'Financial Overview', 'financial_overview'),
(12, 'manage_expense', 'Manage Expense', 'manage_expense'),
(13, 'create_expense', 'Create Expense', 'create_expense'),
(14, 'edit_expense', 'Edit Expense', 'edit_expense'),
(15, 'delete_expense', 'Delete Expense', 'delete_expense'),
(16, 'generate_invoice', 'Generate Invoice', 'generate_invoice'),
(17, 'products', 'Products', 'products'),
(18, 'create_product', 'Create Product', 'create_product'),
(19, 'edit_product', 'Edit Product', 'edit_product'),
(20, 'delete_product', 'Delete Product', 'delete_product'),
(21, 'users', 'Users', 'users'),
(22, 'create_user', 'Create User', 'create_user'),
(23, 'edit_user', 'Edit User', 'edit_user'),
(24, 'delete_user', 'Delete User', 'delete_user'),
(25, 'manage_roles', 'Manage Roles', 'manage_roles'),
(26, 'settings', 'Settings', 'settings'),
(27, 'communication', 'Communication', 'communication'),
(28, 'create_communication', 'Create Communication', 'create_communication'),
(29, 'delete_communication', 'Delete Communication', 'delete_communication'),
(30, 'payroll', 'Payroll', 'payroll'),
(31, 'create_payroll', 'Create Payroll', 'create_payroll'),
(32, 'edit_payroll', 'Edit Payroll', 'edit_payroll'),
(33, 'delete_payroll', 'Delete Payroll', 'delete_payroll'),
(34, 'departments', 'Departments', 'departments'),
(35, 'saved_items', 'Saved Item', 'saved_items'),
(36, 'create_saved_item', 'Create Saved Item', 'create_saved_item'),
(37, 'edit_saved_item', 'Edit Saved Item', 'edit_saved_item'),
(38, 'delete_saved_item', 'Delete Saved Item', 'delete_saved_item'),
(39, 'dashboard', 'Dashboard', 'dashboard'),
(40, 'clients_statistics', 'Clients Statistics', 'clients_statistics'),
(41, 'invoices_statistics', 'Invoices Statistics', 'invoices_statistics'),
(42, 'repairs_statistics', 'Repairs Statistics', 'repairs_statistics'),
(43, 'financial_overview_graph', 'Financial Overview Graph', 'financial_overview_graph'),
(44, 'calendar', 'Calendar', 'calendar');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_permission_role`
--

CREATE TABLE `tbl_permission_role` (
  `id` int(30) NOT NULL,
  `permission_id` int(30) NOT NULL,
  `role_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_permission_role`
--

INSERT INTO `tbl_permission_role` (`id`, `permission_id`, `role_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1),
(13, 13, 1),
(14, 14, 1),
(15, 15, 1),
(16, 16, 1),
(17, 17, 1),
(18, 18, 1),
(19, 19, 1),
(20, 20, 1),
(21, 21, 1),
(22, 22, 1),
(23, 23, 1),
(24, 24, 1),
(25, 25, 1),
(26, 26, 1),
(27, 27, 1),
(28, 28, 1),
(29, 29, 1),
(30, 30, 1),
(31, 31, 1),
(32, 32, 1),
(33, 33, 1),
(34, 34, 1),
(35, 35, 1),
(36, 36, 1),
(37, 37, 1),
(38, 38, 1),
(39, 39, 1),
(40, 40, 1),
(41, 41, 1),
(42, 42, 1),
(43, 43, 1),
(44, 44, 1),
(45, 1, 2),
(46, 2, 2),
(47, 6, 2),
(48, 9, 2),
(49, 12, 2),
(50, 17, 2),
(51, 35, 2),
(52, 39, 2),
(53, 40, 2),
(54, 41, 2),
(55, 42, 2),
(56, 43, 2),
(57, 44, 2),
(236, 34, 4),
(237, 1, 3),
(238, 2, 3),
(239, 3, 3),
(240, 4, 3),
(241, 5, 3),
(242, 6, 3),
(243, 7, 3),
(244, 8, 3),
(245, 9, 3),
(246, 10, 3),
(247, 13, 3),
(248, 14, 3),
(249, 17, 3),
(250, 18, 3),
(251, 26, 3),
(252, 27, 3),
(253, 28, 3),
(254, 29, 3),
(255, 34, 3),
(256, 35, 3),
(257, 36, 3),
(258, 37, 3),
(259, 38, 3),
(260, 39, 3),
(261, 40, 3),
(262, 41, 3),
(263, 42, 3),
(264, 43, 3),
(265, 44, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_role`
--

CREATE TABLE `tbl_role` (
  `id` int(11) NOT NULL,
  `role_name` varchar(200) NOT NULL,
  `slug` varchar(500) NOT NULL,
  `delete_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_role`
--

INSERT INTO `tbl_role` (`id`, `role_name`, `slug`, `delete_status`) VALUES
(1, 'Admin', 'admin', 0),
(2, 'client', 'client', 0),
(3, 'Technicians', 'technicians', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sms_config`
--

CREATE TABLE `tbl_sms_config` (
  `id` int(11) NOT NULL,
  `sms_username` varchar(200) NOT NULL,
  `sms_password` varchar(200) NOT NULL,
  `sms_senderid` varchar(200) NOT NULL,
  `created_at` date NOT NULL,
  `delete_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `treatmentid` int(11) NOT NULL,
  `treatmenttype` varchar(25) NOT NULL,
  `treatment_cost` decimal(10,2) NOT NULL,
  `note` text NOT NULL,
  `status` varchar(10) NOT NULL,
  `delete_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`treatmentid`, `treatmenttype`, `treatment_cost`, `note`, `status`, `delete_status`) VALUES
(1, 'Blood Test', 150.00, 'Treatment note here', 'Active', 1),
(2, 'RT-PCR', 1500.00, 'Corona Test', 'Active', 1),
(3, 'OPD Consultation', 300.00, '', 'Active', 0);

-- --------------------------------------------------------

--
-- Table structure for table `treatment_records`
--

CREATE TABLE `treatment_records` (
  `treatment_records_id` int(10) NOT NULL,
  `treatmentid` int(10) NOT NULL,
  `appointmentid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `treatment_description` text NOT NULL,
  `uploads` varchar(100) NOT NULL,
  `treatment_date` date NOT NULL,
  `treatment_time` time NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `loginname` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL,
  `patientname` varchar(50) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `createddateandtime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointmentid`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`billingid`);

--
-- Indexes for table `billing_records`
--
ALTER TABLE `billing_records`
  ADD PRIMARY KEY (`billingservice_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`departmentid`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctorid`);

--
-- Indexes for table `doctor_timings`
--
ALTER TABLE `doctor_timings`
  ADD PRIMARY KEY (`doctor_timings_id`);

--
-- Indexes for table `lifestyle`
--
ALTER TABLE `lifestyle`
  ADD PRIMARY KEY (`lifestyle_id`),
  ADD KEY `prescription_id` (`prescription_id`);

--
-- Indexes for table `manage_website`
--
ALTER TABLE `manage_website`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`medicineid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderid`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientid`),
  ADD KEY `loginid` (`loginid`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentid`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`prescriptionid`);

--
-- Indexes for table `prescription_records`
--
ALTER TABLE `prescription_records`
  ADD PRIMARY KEY (`prescription_record_id`),
  ADD KEY `prescription_id` (`prescription_id`);

--
-- Indexes for table `service_type`
--
ALTER TABLE `service_type`
  ADD PRIMARY KEY (`service_type_id`);

--
-- Indexes for table `tbl_email_config`
--
ALTER TABLE `tbl_email_config`
  ADD PRIMARY KEY (`e_id`);

--
-- Indexes for table `tbl_permission`
--
ALTER TABLE `tbl_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_permission_role`
--
ALTER TABLE `tbl_permission_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_role`
--
ALTER TABLE `tbl_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_sms_config`
--
ALTER TABLE `tbl_sms_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`treatmentid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointmentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `billingid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `billing_records`
--
ALTER TABLE `billing_records`
  MODIFY `billingservice_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `departmentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctorid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `doctor_timings`
--
ALTER TABLE `doctor_timings`
  MODIFY `doctor_timings_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lifestyle`
--
ALTER TABLE `lifestyle`
  MODIFY `lifestyle_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `manage_website`
--
ALTER TABLE `manage_website`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `medicineid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `prescriptionid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `prescription_records`
--
ALTER TABLE `prescription_records`
  MODIFY `prescription_record_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `service_type`
--
ALTER TABLE `service_type`
  MODIFY `service_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_email_config`
--
ALTER TABLE `tbl_email_config`
  MODIFY `e_id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_permission`
--
ALTER TABLE `tbl_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tbl_permission_role`
--
ALTER TABLE `tbl_permission_role`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;

--
-- AUTO_INCREMENT for table `tbl_role`
--
ALTER TABLE `tbl_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_sms_config`
--
ALTER TABLE `tbl_sms_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `treatment`
--
ALTER TABLE `treatment`
  MODIFY `treatmentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lifestyle`
--
ALTER TABLE `lifestyle`
  ADD CONSTRAINT `lifestyle_ibfk_1` FOREIGN KEY (`prescription_id`) REFERENCES `prescription` (`prescriptionid`);

--
-- Constraints for table `prescription_records`
--
ALTER TABLE `prescription_records`
  ADD CONSTRAINT `prescription_records_ibfk_1` FOREIGN KEY (`prescription_id`) REFERENCES `prescription` (`prescriptionid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
