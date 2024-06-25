-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2024 at 03:27 AM
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
-- Database: `exam_overflow`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `id` int(11) NOT NULL,
  `answer_text` text NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `question_id` int(11) NOT NULL,
  `answer` varchar(5) NOT NULL,
  `choice` varchar(2000) NOT NULL,
  `difficulty` varchar(30) NOT NULL,
  `grade` int(11) NOT NULL,
  `question` text NOT NULL,
  `subject` varchar(30) NOT NULL,
  `topic` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`question_id`, `answer`, `choice`, `difficulty`, `grade`, `question`, `subject`, `topic`) VALUES
(1, 'A', 'Autotrophs##Reproduce##Multicellular##Heterotrophs', 'easy', 11, 'Which of the following is not a characteristic of animals?', 'Biology', 'Animal characteristics'),
(2, 'C', 'Radial symmetry##Asymmetry##Bilateral symmetry##All of the above', 'medium', 11, 'In the body organization patter of an animal, if the left and right sides of the body are mirror images of each other, it is called:', 'Biology', 'Animal symmetry'),
(3, 'D', 'Cleavage##Blastula##Gastrula##A and B', 'medium', 11, 'Which of the following developmental processes develop into germ layers?', 'Biology', 'Embryonic development'),
(4, 'A', 'The division of the body into a head, neck, trunk and tail##Their bodies are covered with an exoskeleton##The possession of two pairs of functional appendages##The presence of a well-developed skull', 'easy', 11, 'Which one of the following is a common characteristic of all vertebrates?', 'Biology', 'Vertebrate characteristics'),
(5, 'C', 'It completes in a very short period of time##It results in the rapid production of many offspring##It increases genetic diversity, allowing organisms to survive in an unpredictable environment##It needs less energy and leads to genetic variation in the offspring', 'medium', 11, 'Why is sexual reproduction useful?', 'Biology', 'Benefits of sexual reproductio'),
(6, 'B', 'Syngamy##Parthenogenesis##Gametogenesis##Embryogenesis', 'easy', 11, 'The phenomenon by which a female gamete develops into a new organism without fertilization is called__________.', 'Biology', 'Parthenogenesis'),
(7, 'C', 'Pheromone##Thyroxine##Ecdysone##All of the above', 'medium', 11, 'Metamorphosis of insects is regulated through hormone', 'Biology', 'Insect metamorphosis'),
(8, 'B', 'They are small in size and want to produce more offspring.##To increase chance of fertilization in water.##Sufficient food is available in water to feed offspring.##Water promotes production of large number of gametes', 'medium', 11, 'Animals that have external fertilization produce a large number of gametes. What is the reason?', 'Biology', 'External fertilization'),
(9, 'D', 'Androgeny##Monogamy##Polygamy##Polygyny', 'easy', 11, 'Which mating system involves a male mating with multiple females during a reproductive season?', 'Biology', 'Mating systems'),
(10, 'C', 'Uterus##Magnum##Infundibulum##Ovary', 'medium', 11, 'The site of fertilization in the chicken is', 'Biology', 'Chicken reproduction'),
(11, 'C', 'The egg stage##The larva stage##The pupa stage##The adult stage', 'easy', 11, 'Which of the following is called the resting and inactive stage in the insect life cycle?', 'Biology', 'Insect life cycle'),
(12, 'D', 'Effective pollinators##Sources of useful products and potential protein##Biological control agents##All of above', 'medium', 11, 'Insects are considered to be beneficial because they/are', 'Biology', 'Beneficial insects'),
(13, 'D', 'Conditioning##Habituation##Instrumental learning##A and C', 'medium', 11, 'When laying eggs, a female insect returns to her larval host plant, even though she has not fed upon this plant during her adult life. This is an example of:', 'Biology', 'Insect behavior'),
(14, 'B', 'Learned##Innate##Afferent##None of the above', 'medium', 11, 'Behavior patterns that change drastically over the lifetime of an insect are probably:', 'Biology', 'Insect behavior'),
(15, 'B', 'Transverse orientation##A circadian rhythm##Diurnal behavior##Exogenous entrainment', 'medium', 11, 'A certain insect usually becomes active each day at dusk. If kept in the dark all day, it will still become active around sunset even though it cannot see the sun. This behavior is an example of:', 'Biology', 'Insect behavior'),
(16, 'D', 'Thomson##Rutherford##Becquerel##Dalton', 'easy', 11, 'Which of the following scientists did not contribute to determining the structure of the atom?', 'Chem', 'Atomic Structure'),
(17, 'D', 'Green##Red##Yellow##Blue', 'easy', 11, 'Among the following, which colour corresponds to light of the highest frequency?', 'Chem', 'Electromagnetic Radiation'),
(18, 'B', '1s##2d##3p##4f', 'medium', 11, 'Which of the following orbital designations does not exist?', 'Chem', 'Atomic Structure'),
(19, 'B', 'Carbon##Magnesium##Beryllium##Boron', 'medium', 11, 'Which of the following has the lowest electronegativity?', 'Chem', 'Periodic Trends'),
(20, 'B', 'benzene and ethanol##acetonitrile and acetone##KCl and water##benzene and carbon tetrachloride', 'medium', 11, 'Among the following mixtures dipole-dipole as the major interaction is present in:', 'Chem', 'Intermolecular Forces'),
(21, 'A', 'π-molecular orbital##σ-molecular orbital##δ-molecular orbital##no bond will form', 'easy', 11, 'The main axis of a diatomic molecule is Z. Atomic orbitals px and py overlap to form which of the following orbital?', 'Chem', 'Molecular Orbital Theory'),
(22, 'A', 'pentagonal bipyramid##square pyramid##trigonal bipyramid##octahedral', 'medium', 11, 'The structure of IF7 is:', 'Chem', 'VSEPR Theory'),
(23, 'D', '1##2##3##4', 'medium', 11, 'The maximum number of hydrogen bonds that a molecule of water can have is:', 'Chem', 'Intermolecular Forces'),
(24, 'D', 'overlap of two s orbitals##overlap of an s and a p orbital##overlap of two p orbitals along their axes##sidewise overlap of two parallel p orbitals', 'medium', 11, 'A π(pi) bond is the result of the:', 'Chem', 'Covalent Bonding'),
(25, 'D', 'Thomson##Rutherford##Becquerel##Dalton', 'easy', 11, 'Which of the following scientists did not contribute to determining the structure of the atom?', 'Chem', 'Atomic Structure'),
(26, 'D', 'Green##Red##Yellow##Blue', 'easy', 11, 'Among the following, which colour corresponds to light of the highest frequency?', 'Chem', 'Electromagnetic Radiation'),
(27, 'B', '1s##2d##3p##4f', 'medium', 11, 'Which of the following orbital designations does not exist?', 'Chem', 'Atomic Structure'),
(28, 'B', 'Carbon##Magnesium##Beryllium##Boron', 'medium', 11, 'Which of the following has the lowest electronegativity?', 'Chem', 'Periodic Trends'),
(29, 'B', 'benzene and ethanol##acetonitrile and acetone##KCl and water##benzene and carbon tetrachloride', 'medium', 11, 'Among the following mixtures dipole-dipole as the major interaction is present in:', 'Chem', 'Intermolecular Forces'),
(30, 'A', 'π-molecular orbital##σ-molecular orbital##δ-molecular orbital##no bond will form', 'easy', 11, 'The main axis of a diatomic molecule is Z. Atomic orbitals px and py overlap to form which of the following orbital?', 'Chem', 'Molecular Orbital Theory'),
(31, 'A', 'pentagonal bipyramid##square pyramid##trigonal bipyramid##octahedral', 'medium', 11, 'The structure of IF7 is:', 'Chem', 'VSEPR Theory'),
(32, 'D', '1##2##3##4', 'medium', 11, 'The maximum number of hydrogen bonds that a molecule of water can have is:', 'Chem', 'Intermolecular Forces'),
(33, 'D', 'overlap of two s orbitals##overlap of an s and a p orbital##overlap of two p orbitals along their axes##sidewise overlap of two parallel p orbitals', 'medium', 11, 'A π(pi) bond is the result of the:', 'Chem', 'Covalent Bonding'),
(34, 'C', 'hydrogen bonds##electrostatic attraction##Van der Waal\'s attraction##dipole-dipole attraction', 'medium', 11, 'Molecules are held together in a crystal by:', 'Chem', 'Intermolecular Forces'),
(35, 'C', '2##4##6##8', 'easy', 11, 'What is the value of the expression (3x^2 - 5x + 2) evaluated at x = 2?', 'Math', 'Algebraic Expressions'),
(36, 'B', '1##2##3##4', 'medium', 11, 'The slope of a line passing through the points (2, 3) and (5, 7) is:', 'Math', 'Coordinate Geometry'),
(37, 'A', '4/5##3/5##2/5##1/5', 'medium', 11, 'If sin(θ) = 3/5, then the value of cos(θ) is:', 'Math', 'Trigonometry'),
(38, 'D', '540°##720°##900°##1080°', 'medium', 11, 'The sum of the interior angles of a hexagon is:', 'Math', 'Geometry'),
(39, 'C', 'y = 2x + 1##y = 2x - 1##y = (7-3)/(5-2) x + 3##y = (7-3)/(5-2) x - 1', 'difficult', 11, 'The equation of a line passing through the points (2, 3) and (5, 7) is:', 'Math', 'Coordinate Geometry'),
(40, 'A', '-2##0##2##6', 'medium', 11, 'The determinant of the matrix [[1, 2], [3, 4]] is:', 'Math', 'Matrix Operations'),
(41, 'A', 'x = 1, x = 2##x = 2, x = 3##x = 1, x = 4##x = 2, x = 4', 'medium', 11, 'The solution of the equation x^2 - 5x + 6 = 0 is:', 'Math', 'Quadratic Equations'),
(42, 'A', '-1##0##1##2', 'easy', 11, 'The value of the expression (2^3 - 3^2) / (4^2 - 1) is:', 'Math', 'Algebraic Expressions'),
(43, 'A', '(x-3)^2 + (y-4)^2 = 25##(x+3)^2 + (y-4)^2 = 25##(x-3)^2 + (y+4)^2 = 25##(x+3)^2 + (y+4)^2 = 25', 'medium', 11, 'The equation of a circle with center (3, 4) and radius 5 is:', 'Math', 'Coordinate Geometry'),
(44, 'D', '45°##60°##90°##135°', 'medium', 11, 'The measure of an exterior angle of a regular polygon with 8 sides is:', 'Math', 'Geometry'),
(45, 'C', '1##2##3##4', 'easy', 11, 'The value of the expression log(1000) is:', 'Math', 'Logarithms'),
(46, 'A', 'a parabola opening upwards##a parabola opening downwards##a straight line##a hyperbola', 'medium', 11, 'The graph of the function y = 2x^2 - 3x + 1 is:', 'Math', 'Functions'),
(47, 'D', '25##50##100##225', 'medium', 11, 'The sum of the first 10 odd natural numbers is:', 'Math', 'Sequences and Series'),
(48, 'D', '1/2##1/3##1/4##1/6', 'easy', 11, 'The probability of rolling a 3 on a six-sided die is:', 'Math', 'Probability'),
(49, 'B', '1/2##√2/2##√3/2##1', 'easy', 11, 'The value of sin(45°) is:', 'Math', 'Trigonometry'),
(50, 'A', '2x + 3y = 13##2x + 3y = -1##2x + 3y = 21##2x + 3y = -13', 'medium', 11, 'The equation of a line that is parallel to the line 2x + 3y = 7 and passes through the point (4, 2) is:', 'Math', 'Coordinate Geometry'),
(51, 'A', '-16##-9##0##16', 'easy', 11, 'The value of the expression 3^2 + 4^2 - 5^2 is:', 'Math', 'Algebraic Expressions'),
(52, 'A', '-5##0##5##6', 'medium', 11, 'The sum of the roots of the quadratic equation x^2 - 5x + 6 = 0 is:', 'Math', 'Quadratic Equations'),
(53, 'B', '6√3 square units##12√3 square units##18√3 square units##24√3 square units', 'medium', 11, 'The area of a regular hexagon with side length 4 units is:', 'Math', 'Geometry'),
(54, 'C', 'x^2 + 5x + 4##x^2 + 5x + 9##x^2 + 7x + 4##x^2 + 7x + 9', 'medium', 11, 'The value of the expression (2x + 3)^2 - (x - 1)^2 is:', 'Math', 'Algebraic Expressions'),
(55, 'C', 'y = 2x + 1##y = 2x - 1##y = (7-3)/(4-2) x + 3##y = (7-3)/(4-2) x - 1', 'medium', 11, 'The equation of a line that passes through the points (2, 3) and (4, 7) is:', 'Math', 'Coordinate Geometry'),
(56, 'B', '90°##180°##270°##360°', 'easy', 11, 'The sum of the angles of a triangle is:', 'Math', 'Geometry'),
(57, 'B', '1##2##3##4', 'easy', 11, 'The value of the expression log(100) + log(10) is:', 'Math', 'Logarithms'),
(58, 'C', 'a parabola opening upwards##a parabola opening downwards##a straight line##a hyperbola', 'easy', 11, 'The graph of the function y = -2x + 3 is:', 'Math', 'Functions'),
(59, 'A', 'a + (n-1)d##a * (n-1)d##a + nd##a * nd', 'medium', 11, 'The nth term of an arithmetic sequence with first term a and common difference d is:', 'Math', 'Sequences and Series'),
(60, 'C', '2##4##6##8', 'easy', 11, 'What is the value of the expression (3x^2 - 5x + 2) evaluated at x = 2?', 'Math', 'Algebraic Expressions'),
(61, 'B', '1##2##3##4', 'medium', 11, 'The slope of a line passing through the points (2, 3) and (5, 7) is:', 'Math', 'Coordinate Geometry'),
(62, 'A', '4/5##3/5##2/5##1/5', 'medium', 11, 'If sin(θ) = 3/5, then the value of cos(θ) is:', 'Math', 'Trigonometry'),
(63, 'D', '540°##720°##900°##1080°', 'medium', 11, 'The sum of the interior angles of a hexagon is:', 'Math', 'Geometry'),
(64, 'C', 'y = 2x + 1##y = 2x - 1##y = (7-3)/(5-2) x + 3##y = (7-3)/(5-2) x - 1', 'difficult', 11, 'The equation of a line passing through the points (2, 3) and (5, 7) is:', 'Math', 'Coordinate Geometry'),
(65, 'A', '-2##0##2##6', 'medium', 11, 'The determinant of the matrix [[1, 2], [3, 4]] is:', 'Math', 'Matrix Operations'),
(66, 'A', 'x = 1, x = 2##x = 2, x = 3##x = 1, x = 4##x = 2, x = 4', 'medium', 11, 'The solution of the equation x^2 - 5x + 6 = 0 is:', 'Math', 'Quadratic Equations'),
(67, 'A', '-1##0##1##2', 'easy', 11, 'The value of the expression (2^3 - 3^2) / (4^2 - 1) is:', 'Math', 'Algebraic Expressions'),
(68, 'A', '(x-3)^2 + (y-4)^2 = 25##(x+3)^2 + (y-4)^2 = 25##(x-3)^2 + (y+4)^2 = 25##(x+3)^2 + (y+4)^2 = 25', 'medium', 11, 'The equation of a circle with center (3, 4) and radius 5 is:', 'Math', 'Coordinate Geometry'),
(69, 'D', '45°##60°##90°##135°', 'medium', 11, 'The measure of an exterior angle of a regular polygon with 8 sides is:', 'Math', 'Geometry'),
(70, 'C', '1##2##3##4', 'easy', 11, 'The value of the expression log(1000) is:', 'Math', 'Logarithms'),
(71, 'A', 'a parabola opening upwards##a parabola opening downwards##a straight line##a hyperbola', 'medium', 11, 'The graph of the function y = 2x^2 - 3x + 1 is:', 'Math', 'Functions'),
(72, 'D', '25##50##100##225', 'medium', 11, 'The sum of the first 10 odd natural numbers is:', 'Math', 'Sequences and Series'),
(73, 'D', '1/2##1/3##1/4##1/6', 'easy', 11, 'The probability of rolling a 3 on a six-sided die is:', 'Math', 'Probability'),
(74, 'B', '1/2##√2/2##√3/2##1', 'easy', 11, 'The value of sin(45°) is:', 'Math', 'Trigonometry'),
(75, 'A', '2x + 3y = 13##2x + 3y = -1##2x + 3y = 21##2x + 3y = -13', 'medium', 11, 'The equation of a line that is parallel to the line 2x + 3y = 7 and passes through the point (4, 2) is:', 'Math', 'Coordinate Geometry'),
(76, 'A', '-16##-9##0##16', 'easy', 11, 'The value of the expression 3^2 + 4^2 - 5^2 is:', 'Math', 'Algebraic Expressions'),
(77, 'A', '-5##0##5##6', 'medium', 11, 'The sum of the roots of the quadratic equation x^2 - 5x + 6 = 0 is:', 'Math', 'Quadratic Equations'),
(78, 'B', '6√3 square units##12√3 square units##18√3 square units##24√3 square units', 'medium', 11, 'The area of a regular hexagon with side length 4 units is:', 'Math', 'Geometry'),
(79, 'C', 'x^2 + 5x + 4##x^2 + 5x + 9##x^2 + 7x + 4##x^2 + 7x + 9', 'medium', 11, 'The value of the expression (2x + 3)^2 - (x - 1)^2 is:', 'Math', 'Algebraic Expressions'),
(80, 'C', 'y = 2x + 1##y = 2x - 1##y = (7-3)/(4-2) x + 3##y = (7-3)/(4-2) x - 1', 'medium', 11, 'The equation of a line that passes through the points (2, 3) and (4, 7) is:', 'Math', 'Coordinate Geometry'),
(81, 'B', '90°##180°##270°##360°', 'easy', 11, 'The sum of the angles of a triangle is:', 'Math', 'Geometry'),
(82, 'B', '1##2##3##4', 'easy', 11, 'The value of the expression log(100) + log(10) is:', 'Math', 'Logarithms'),
(83, 'C', 'a parabola opening upwards##a parabola opening downwards##a straight line##a hyperbola', 'easy', 11, 'The graph of the function y = -2x + 3 is:', 'Math', 'Functions'),
(84, 'A', 'a + (n-1)d##a * (n-1)d##a + nd##a * nd', 'medium', 11, 'The nth term of an arithmetic sequence with first term a and common difference d is:', 'Math', 'Sequences and Series'),
(85, 'C', 'Transport of materials##Cell-cell communication##Photosynthesis##Structural support', 'easy', 12, 'Which of the following is NOT a function of the cell membrane?', 'Biology', 'Cell Biology'),
(86, 'D', 'Photosynthesis##Respiration##Digestion##Metabolism', 'easy', 12, 'The process by which an organism converts food into energy is called:', 'Biology', 'Biochemistry'),
(87, 'A', 'Nucleus##Mitochondria##Ribosome##Cytoplasm', 'easy', 12, 'The part of the cell that contains the genetic material is called the:', 'Biology', 'Cell Biology'),
(88, 'D', 'Epithelial tissue##Muscular tissue##Nervous tissue##Connective tissue', 'medium', 12, 'Which of the following is NOT a type of tissue found in the human body?', 'Biology', 'Anatomy and Physiology'),
(89, 'A', 'Mitosis##Meiosis##Cytokinesis##Cell differentiation', 'medium', 12, 'The process by which a cell divides into two or more daughter cells is called:', 'Biology', 'Cell Biology'),
(90, 'A', 'Photosynthesis##Cellular respiration##Transpiration##Fermentation', 'medium', 12, 'The process by which plants convert light energy into chemical energy is called:', 'Biology', 'Plant Biology'),
(91, 'C', 'Cerebrum##Cerebellum##Medulla oblongata##Hypothalamus', 'medium', 12, 'The part of the brain that controls involuntary body functions like heart rate and breathing is called the:', 'Biology', 'Anatomy and Physiology'),
(92, 'B', 'Photosynthesis##Cellular respiration##Fermentation##Digestion', 'medium', 12, 'The process by which organisms obtain energy from organic compounds is called:', 'Biology', 'Biochemistry'),
(93, 'A', 'Ecology##Evolution##Genetics##Botany', 'medium', 12, 'The study of the relationships between living organisms and their environment is called:', 'Biology', 'Ecology'),
(94, 'B', 'Gametogenesis##Fertilization##Embryogenesis##Meiosis', 'medium', 12, 'The process by which a sperm cell fertilizes an egg cell is called:', 'Biology', 'Reproduction'),
(95, 'C', 'Nucleus##Mitochondria##Chloroplast##Vacuole', 'easy', 12, 'The structure in plant cells that contains chlorophyll and is responsible for photosynthesis is called the:', 'Biology', 'Plant Biology'),
(96, 'C', 'Adaptation##Natural selection##Evolution##Mutation', 'medium', 12, 'The process by which an organism changes over time in response to its environment is called:', 'Biology', 'Evolution'),
(97, 'A', 'Artery##Vein##Capillary##Lymphatic vessel', 'easy', 12, 'The type of blood vessel that carries blood away from the heart is called an:', 'Biology', 'Anatomy and Physiology'),
(98, 'C', 'Photosynthesis##Cellular respiration##Digestion##Fermentation', 'medium', 12, 'The process by which an organism breaks down food to obtain energy is called:', 'Biology', 'Biochemistry'),
(99, 'B', 'Mitosis##Meiosis##Cytokinesis##Cell differentiation', 'medium', 12, 'The type of cell division that produces gametes (sex cells) is called:', 'Biology', 'Cell Biology'),
(100, 'B', 'Cerebrum##Cerebellum##Medulla oblongata##Hypothalamus', 'medium', 12, 'The part of the brain that is responsible for voluntary movement and coordination is called the:', 'Biology', 'Anatomy and Physiology'),
(101, 'B', 'Photosynthesis##Transpiration##Respiration##Evaporation', 'easy', 12, 'The process by which plants lose water vapor through their leaves is called:', 'Biology', 'Plant Biology'),
(102, 'C', 'Ecology##Evolution##Genetics##Botany', 'medium', 12, 'The study of the inheritance of traits is called:', 'Biology', 'Genetics'),
(103, 'B', 'Artery##Vein##Capillary##Lymphatic vessel', 'easy', 12, 'The type of blood vessel that carries blood to the heart is called a:', 'Biology', 'Anatomy and Physiology'),
(104, 'C', 'Photosynthesis##Cellular respiration##Fermentation##Digestion', 'medium', 12, 'The process by which an organism obtains energy from organic compounds without the use of oxygen is called:', 'Biology', 'Biochemistry'),
(105, 'C', 'Adaptation##Natural selection##Evolution##Mutation', 'medium', 12, 'The process by which new species arise over time is called:', 'Biology', 'Evolution'),
(106, 'A', 'Mitosis##Meiosis##Cytokinesis##Cell differentiation', 'medium', 12, 'The type of cell division that produces genetically identical daughter cells is called:', 'Biology', 'Cell Biology'),
(107, 'A', 'Cerebrum##Cerebellum##Medulla oblongata##Hypothalamus', 'medium', 12, 'The part of the brain that is responsible for higher mental functions like reasoning and memory is called the:', 'Biology', 'Anatomy and Physiology'),
(108, 'A', 'Photosynthesis##Cellular respiration##Transpiration##Fermentation', 'medium', 12, 'The process by which plants convert light energy into chemical energy is called:', 'Biology', 'Plant Biology'),
(109, 'A', 'Ecology##Evolution##Genetics##Botany', 'medium', 12, 'The study of the interactions between living organisms and their environment is called:', 'Biology', 'Ecology'),
(110, 'B', 'Gametogenesis##Fertilization##Embryogenesis##Meiosis', 'medium', 12, 'The process by which an egg cell is fertilized by a sperm cell is called:', 'Biology', 'Reproduction'),
(111, 'D', 'Nucleus##Mitochondria##Chloroplast##Vacuole', 'easy', 12, 'The structure in plant cells that stores water, nutrients, and waste is called the:', 'Biology', 'Plant Biology'),
(112, 'D', 'Adaptation##Natural selection##Evolution##Mutation', 'medium', 12, 'The process by which a new trait appears in an organism due to a change in its genetic material is called:', 'Biology', 'Genetics'),
(113, 'C', 'Artery##Vein##Capillary##Lymphatic vessel', 'easy', 12, 'The type of blood vessel that connects arteries and veins is called a:', 'Biology', 'Anatomy and Physiology'),
(114, 'B', 'Photosynthesis##Cellular respiration##Digestion##Fermentation', 'medium', 12, 'The process by which an organism breaks down glucose to release energy is called:', 'Biology', 'Biochemistry'),
(115, 'A', 'Joule##Newton##Watt##Meter', 'easy', 12, 'The SI unit for energy is:', 'Chemistry', 'Units and Measurements'),
(116, 'C', '0 to 7##1 to 14##0 to 14##7 to 14', 'easy', 12, 'The pH scale ranges from:', 'Chemistry', 'Acid-Base Chemistry'),
(117, 'B', 'CO##CO2##CH4##H2O', 'easy', 12, 'The chemical formula for carbon dioxide is:', 'Chemistry', 'Inorganic Chemistry'),
(118, 'C', 'Boiling water##Dissolving sugar in water##Burning a piece of paper##Cutting a piece of wood', 'medium', 12, 'Which of the following is an example of a chemical change?', 'Chemistry', 'Chemical Reactions'),
(119, 'B', 'Atomic mass##Atomic number##Electronegativity##Valence electrons', 'medium', 12, 'The periodic table is organized based on:', 'Chemistry', 'Atomic Structure'),
(120, 'B', 'Evaporation##Sublimation##Condensation##Melting', 'medium', 12, 'The process of a solid turning directly into a gas is called:', 'Chemistry', 'States of Matter'),
(121, 'A', 'Joule##Newton##Watt##Meter', 'easy', 12, 'The SI unit for energy is:', 'Chemistry', 'Units and Measurements'),
(122, 'C', '0 to 7##1 to 14##0 to 14##7 to 14', 'easy', 12, 'The pH scale ranges from:', 'Chemistry', 'Acid-Base Chemistry'),
(123, 'B', 'CO##CO2##CH4##H2O', 'easy', 12, 'The chemical formula for carbon dioxide is:', 'Chemistry', 'Inorganic Chemistry'),
(124, 'C', 'Boiling water##Dissolving sugar in water##Burning a piece of paper##Cutting a piece of wood', 'medium', 12, 'Which of the following is an example of a chemical change?', 'Chemistry', 'Chemical Reactions'),
(125, 'B', 'Atomic mass##Atomic number##Electronegativity##Valence electrons', 'medium', 12, 'The periodic table is organized based on:', 'Chemistry', 'Atomic Structure'),
(126, 'B', 'Evaporation##Sublimation##Condensation##Melting', 'medium', 12, 'The process of a solid turning directly into a gas is called:', 'Chemistry', 'States of Matter'),
(127, 'B', 'Atomic mass##Atomic number##Mass number##Valence electrons', 'easy', 12, 'The number of protons in an atom\'s nucleus is its:', 'Chemistry', 'Atomic Structure'),
(128, 'D', 'Salad##Sand and water##Muddy water##Saltwater', 'medium', 12, 'Which of the following is an example of a homogeneous mixture?', 'Chemistry', 'Solutions'),
(129, 'B', 'Oxidation##Reduction##Combustion##Neutralization', 'medium', 12, 'The chemical process where a substance gains electrons is called:', 'Chemistry', 'Chemical Reactions'),
(130, 'B', 'Sodium##Chlorine##Neon##Argon', 'easy', 12, 'The name of the element with the atomic number 17 is:', 'Chemistry', 'Periodic Table'),
(131, 'B', 'Heat capacity##Specific heat##Latent heat##Enthalpy', 'medium', 12, 'The amount of heat required to raise the temperature of 1 gram of a substance by 1 degree Celsius is called its:', 'Chemistry', 'Thermochemistry'),
(132, 'B', 'NaCl##H2O##KCl##Both b and c', 'medium', 12, 'Which of the following is an example of a covalent bond?', 'Chemistry', 'Chemical Bonding'),
(133, 'A', 'pH##Molarity##Normality##Concentration', 'medium', 12, 'The measure of the strength of an acid or base is called its:', 'Chemistry', 'Acid-Base Chemistry'),
(134, 'D', 'Density##Melting point##Boiling point##Malleability', 'medium', 12, 'The physical property of a substance that describes how easily it can be deformed is called its:', 'Chemistry', 'States of Matter'),
(135, 'A', 'CH4 + 2O2 → CO2 + 2H2O##2CH4 + O2 → 2CO + 4H2##CH4 + 4O2 → CO2 + 2H2O##CH4 + O2 → CO + 2H2O', 'medium', 12, 'The balanced chemical equation for the combustion of methane is:', 'Chemistry', 'Chemical Reactions'),
(136, 'D', 'Filtration##Distillation##Chromatography##All of the above', 'medium', 12, 'The process of separating a mixture into its individual components is called:', 'Chemistry', 'Separation Techniques'),
(137, 'C', 'Atomic mass##Atomic number##Electron configuration##Electronegativity', 'medium', 12, 'The periodic table is organized into groups and periods based on the:', 'Chemistry', 'Periodic Table'),
(138, 'A', 'Oxidation##Reduction##Combustion##Neutralization', 'medium', 12, 'The chemical process where a substance loses electrons is called:', 'Chemistry', 'Chemical Reactions'),
(139, 'C', 'Hydrogen##Helium##Oxygen##Neon', 'easy', 12, 'The name of the element with the atomic number 8 is:', 'Chemistry', 'Periodic Table'),
(140, 'B', 'pH##Molarity##Normality##Concentration', 'medium', 12, 'The measure of the amount of a substance per unit volume is called its:', 'Chemistry', 'Solutions'),
(141, 'B', 'Burning a piece of paper##Dissolving sugar in water##Rusting of iron##Cooking an egg', 'medium', 12, 'Which of the following is an example of a physical change?', 'Chemistry', 'Chemical Reactions'),
(142, 'A', 'H2O##CO2##NaCl##CH4', 'easy', 12, 'The chemical formula for water is:', 'Chemistry', 'Inorganic Chemistry'),
(143, 'A', 'Evaporation##Condensation##Sublimation##Boiling', 'medium', 12, 'The process of converting a substance from a liquid to a gas is called:', 'Chemistry', 'States of Matter'),
(144, 'C', 'Atomic mass##Atomic number##Mass number##Valence electrons', 'medium', 12, 'The number of neutrons in an atom\'s nucleus is its:', 'Chemistry', 'Atomic Structure'),
(145, 'D', 'Saltwater##Lemonade##Milk##Sand and water', 'medium', 12, 'Which of the following is an example of a heterogeneous mixture?', 'Chemistry', 'Solutions'),
(146, 'D', 'Oxidation##Reduction##Combustion##Neutralization', 'medium', 12, 'The chemical process where an acid and a base react to form a salt and water is called:', 'Chemistry', 'Acid-Base Chemistry'),
(147, 'A', 'Hydrogen##Helium##Lithium##Beryllium', 'easy', 12, 'The name of the element with the atomic number 1 is:', 'Chemistry', 'Periodic Table'),
(148, 'C', 'Heat capacity##Specific heat##Latent heat##Enthalpy', 'medium', 12, 'The amount of heat required to change the phase of a substance without changing its temperature is called its:', 'Chemistry', 'Thermochemistry'),
(149, 'B', 'H2O##NaCl##CH4##Both a and c', 'medium', 12, 'Which of the following is an example of an ionic bond?', 'Chemistry', 'Chemical Bonding'),
(150, 'A', 'pH##Molarity##Normality##Concentration', 'medium', 12, 'The measure of the concentration of hydrogen ions in a solution is called its:', 'Chemistry', 'Acid-Base Chemistry'),
(151, 'A', 'KE = 1/2 mv^2##KE = 1/2 m/v^2##KE = 1/2 v/m^2##KE = 1/2 m^2v', 'easy', 11, 'The formula for the kinetic energy of an object is:', 'Physics', 'Mechanics'),
(152, 'A', 'PE = mgh##PE = 1/2 mv^2##PE = mg/h##PE = 1/2 m^2g', 'easy', 11, 'The formula for the potential energy of an object due to gravity is:', 'Physics', 'Mechanics'),
(153, 'A', 'F_f = μN##F_f = N/μ##F_f = μ/N##F_f = Nμ', 'easy', 11, 'The formula for the force of friction is:', 'Physics', 'Mechanics'),
(154, 'A', 'T = 2π√(l/g)##T = 2πl/g##T = 2πg/l##T = 2πlg', 'medium', 11, 'The formula for the period of a simple pendulum is:', 'Physics', 'Mechanics'),
(155, 'A', 'y = mx + b##y = mx^2 + b##y = mx^3 + b##y = mx/b', 'easy', 11, 'The formula for the equation of a straight line is:', 'Physics', 'Mechanics'),
(156, 'A', 's = rθ##s = r/θ##s = rθ##s = θ/r', 'medium', 11, 'The formula for the displacement of an object in uniform circular motion is:', 'Physics', 'Mechanics'),
(157, 'A', 'F_c = mv^2/r##F_c = mr/v^2##F_c = m/rv^2##F_c = mv^2r', 'medium', 11, 'The formula for the centripetal force acting on an object in uniform circular motion is:', 'Physics', 'Mechanics'),
(158, 'A', 'U = kQ1Q2/r##U = kQ1/Q2r##U = kQ1r/Q2##U = kQ1Q2/r', 'medium', 11, 'The formula for the electric potential energy of a point charge is:', 'Physics', 'Electricity'),
(159, 'A', 'V = kQ/r##V = kr/Q##V = kQr##V = k/Qr', 'medium', 11, 'The formula for the electric potential at a point due to a point charge is:', 'Physics', 'Electricity'),
(160, 'A', 'R = ρL/A##R = ρA/L##R = ρ/LA##R = ρL/A', 'easy', 11, 'The formula for the resistance of a conductor is:', 'Physics', 'Electricity'),
(161, 'A', 'C = ε_0 A/d##C = ε_0 d/A##C = ε_0 Ad##C = ε_0/Ad', 'medium', 11, 'The formula for the capacitance of a parallel plate capacitor is:', 'Physics', 'Electricity'),
(162, 'D', 'ε = -N(dΦ/dt)##ε = NΦ/t##ε = Φ/N##ε = N(dΦ/dt)', 'medium', 11, 'The formula for Faraday\'s law of electromagnetic induction is:', 'Physics', 'Electromagnetism'),
(163, 'C', 'f = 1/T##f = T/1##f = v/λ##f = λ/v', 'easy', 11, 'The formula for the frequency of a wave is:', 'Physics', 'Waves'),
(164, 'A', 'λ = v/f##λ = f/v##λ = vf##λ = vf', 'easy', 11, 'The formula for the wavelength of a wave is:', 'Physics', 'Waves'),
(165, 'A', 'v = √(T/μ)##v = √(μ/T)##v = T√(μ)##v = μ√(T)', 'medium', 11, 'The formula for the speed of a transverse wave on a string is:', 'Physics', 'Waves'),
(166, 'A', 'f\' = f(v+v_s)/(v+v_o)##f\' = f(v-v_s)/(v-v_o)##f\' = f(vv_s)/(vv_o)##f\' = f(v/v_s)/(v/v_o)', 'medium', 11, 'The formula for the Doppler effect is:', 'Physics', 'Waves'),
(167, 'A', 'E = mc^2##E = m/c^2##E = mc^4##E = m^2c^2', 'medium', 11, 'The formula for the relativistic energy of a particle is:', 'Physics', 'Modern Physics'),
(168, 'A', 'λ = h/p##λ = p/h##λ = hp##λ = p^2/h', 'medium', 11, 'The formula for the de Broglie wavelength of a particle is:', 'Physics', 'Modern Physics'),
(169, 'A', 'E_k = hf - Φ##E_k = hf + Φ##E_k = h/f - Φ##E_k = h/f + Φ', 'medium', 11, 'The formula for the photoelectric effect is:', 'Physics', 'Modern Physics'),
(170, 'A', 'ΔxΔp ≥ h/2π##ΔxΔp ≤ h/2π##ΔxΔp = h/2π##ΔxΔp > h/2π', 'medium', 11, 'The formula for the uncertainty principle is:', 'Physics', 'Modern Physics'),
(171, 'A', 'F = G*m1*m2/r^2##F = G*m1/m2*r^2##F = G*m1*r^2/m2##F = G*(m1+m2)/r^2', 'medium', 11, 'The formula for the gravitational force between two objects is:', 'Physics', 'Mechanics'),
(172, 'A', 'v_e = √(2GM/R)##v_e = √(GM/2R)##v_e = √(GM*R)##v_e = √(2G/MR)', 'medium', 11, 'The formula for the escape velocity of an object is:', 'Physics', 'Mechanics'),
(173, 'A', 'v = √(γRT/M)##v = √(γM/RT)##v = √(RT/γM)##v = √(M/γRT)', 'medium', 11, 'The formula for the speed of sound in air is:', 'Physics', 'Waves'),
(174, 'A', 'I = P/A##I = P*A##I = A/P##I = A^2/P', 'medium', 11, 'The formula for the intensity of a wave is:', 'Physics', 'Waves'),
(175, 'A', 'η = W/Q_h##η = Q_h/W##η = W/Q_c##η = Q_c/W', 'medium', 11, 'The formula for the efficiency of a heat engine is:', 'Physics', 'Thermodynamics'),
(176, 'A', 'E = mc^2##E = m/c^2##E = m^2c^2##E = mc^4', 'medium', 11, 'The formula for the energy released in a nuclear reaction is:', 'Physics', 'Modern Physics'),
(177, 'A', 't = ln(2)/λ##t = 2/ln(λ)##t = ln(λ)/2##t = λ/ln(2)', 'medium', 11, 'The formula for the lifetime of a radioactive isotope is:', 'Physics', 'Modern Physics'),
(178, 'A', 'E = hf##E = h/f##E = hc/λ##E = h^2/m', 'medium', 11, 'The formula for the energy of a photon is:', 'Physics', 'Modern Physics'),
(179, 'A', 'λ = h/mv##λ = h/m^2v##λ = h*mv##λ = h/mv^2', 'medium', 11, 'The formula for the de Broglie wavelength of an electron is:', 'Physics', 'Modern Physics'),
(180, 'D', 't_1/2 = ln(2)/λ##t_1/2 = 2/λ##t_1/2 = ln(λ)/2##t_1/2 = λ/ln(2)', 'medium', 11, 'The formula for the half-life of a radioactive isotope is:', 'Physics', 'Modern Physics');

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE `material` (
  `id` int(11) NOT NULL,
  `grade` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `subject` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`id`, `grade`, `link`, `subject`) VALUES
(1, 11, 'https://www.dropbox.com/scl/fi/c2p2iuc0gymkno6wsa3kw/G11-English-STB-2023-web.pdf?rlkey=v5y457nqstzozaiudwio88zif&st=5x5ozk1f&dl=0', 'English'),
(2, 11, 'https://www.dropbox.com/scl/fi/h2wehrblhgfewt6ff3ux9/G11-Chemistry-STB-2023-web.pdf?rlkey=87rh6hsx59lcw8soasqucstpl&st=qsg6b7bl&dl=0', 'Chemistry'),
(3, 11, 'https://www.dropbox.com/scl/fi/fk0m03w2lkmmv3ltrqv0j/G11-Biology-STB-2023-web.pdf?rlkey=jem2svnpn7h1ryx08e88c9n04&st=l02rpve3&dl=0', 'Biology'),
(4, 11, 'https://www.dropbox.com/scl/fi/r0yc4ccmm9qgcmlz7wl21/G11-Mathematics-STB-2023-web.pdf?rlkey=inoe3sidcp2zv7udxl9vwnqx5&st=p55a2wri&dl=0', 'Mathematics'),
(5, 11, 'https://www.dropbox.com/scl/fi/2roa1rvx4nyjjht3d1l9f/G11-Physics-STB-2023-web.pdf?rlkey=wluh1d9yvkjzeb4g5z1x4jx6v&st=o4j170qw&dl=0', 'Physics'),
(6, 11, 'https://www.dropbox.com/scl/fi/d2kbs1tuv1q15eoli8ztn/G11-IT-STB-2023-web.pdf?rlkey=yqwbd9gjduqtvps5qlt72z06y&st=9gficanm&dl=0', 'IT'),
(7, 12, 'https://www.dropbox.com/scl/fi/fwhvmy4xbt7jt4dnysicz/G12-English-STB-2023-web.pdf?rlkey=mbv7ad9l50pbndr75wtoe22cl&st=v3ps24k7&dl=0', 'English'),
(8, 12, 'https://www.dropbox.com/scl/fi/h9jmv788s1x0p3cchotha/G12-Chemistry-STB-2023-web.pdf?rlkey=vik0sfy0dq48xt6xt9h65vsdy&st=9z4oo00k&dl=0', 'Chemistry'),
(9, 12, 'https://www.dropbox.com/scl/fi/m5g3iez84mvav0tg5xsd0/G12-Biology-STB-2023-web.pdf?rlkey=gp5x3lo580f7twqqd57y48mfp&st=3rivqvcw&dl=0', 'Biology'),
(10, 12, 'https://www.dropbox.com/scl/fi/5ifep63f9je0h22cvkcij/G12-Physics-STB-2023-web.pdf?rlkey=ra3xl0eeduja447gy1exo084b&st=wv3fo6gy&dl=0', 'Physics'),
(11, 12, 'https://www.dropbox.com/scl/fi/d2kbs1tuv1q15eoli8ztn/G12-IT-STB-2023-web.pdf?rlkey=yqwbd9gjduqtvps5qlt72z06y&st=9gficanm&dl=0', 'IT');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `subject` varchar(30) NOT NULL,
  `topic` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `subject`, `topic`, `user_id`) VALUES
(1, 'What is projectile motion', 'Physics', 'Projectile Motion', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_table`
--

CREATE TABLE `users_table` (
  `user_id` int(11) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `student_email` varchar(255) NOT NULL,
  `student_password` varchar(255) NOT NULL,
  `student_grade` int(11) NOT NULL DEFAULT 11
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_table`
--

INSERT INTO `users_table` (`user_id`, `student_name`, `student_email`, `student_password`, `student_grade`) VALUES
(1, 'Chera Mihiretu', 'chera@gmail.com', '123456', 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users_table`
--
ALTER TABLE `users_table`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `student_email` (`student_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT for table `material`
--
ALTER TABLE `material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_table`
--
ALTER TABLE `users_table`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users_table` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users_table` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
