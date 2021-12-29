-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2021 at 05:39 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coding_thunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone`, `msg`, `date`) VALUES
(1, 'jeetu', 'jeetu@gmail.com', '1234567890', 'this is jeetu', '2021-12-25 21:36:48'),
(2, 'kunal', 'kunal@gmail.com', '9876543210', 'this is kunal', '2021-12-25 21:36:48'),
(3, 'harsh', 'harsh@gmail.com', '1122334455', 'this is harsh', '2021-12-25 21:36:48'),
(4, 'manoj', 'manoj@gmail.com', '6677889900', 'this is manoj', '2021-12-25 21:36:48');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `tagline` varchar(50) NOT NULL,
  `slug` varchar(25) NOT NULL,
  `post` text NOT NULL,
  `img_file` varchar(30) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `slug`, `post`, `img_file`, `date`) VALUES
(1, 'C ', 'programming language', 'first-post', 'C  is a general-purpose, procedural computer programming language supporting structured programming, lexical variable scope, and recursion, with a static type system. By design, C provides constructs that map efficiently to typical machine instructions. It has found lasting use in applications previously coded in assembly language. Such applications include operating systems and various application software for computer architectures that range from supercomputers to PLCs and embedded systems.\r\n\r\nA successor to the programming language B, C was originally developed at Bell Labs by Dennis Ritchie between 1972 and 1973 to construct utilities running on Unix. It was applied to re-implementing the kernel of the Unix operating system.[6] During the 1980s, C gradually gained popularity. It has become one of the most widely used programming languages,[7][8] with C compilers from various vendors available for the majority of existing computer architectures and operating systems. C has been standardized by ANSI since 1989 (ANSI C) and by the International Organization for Standardization (ISO).\r\n\r\nC is an imperative procedural language. It was designed to be compiled to provide low-level access to memory and language constructs that map efficiently to machine instructions, all with minimal runtime support. Despite its low-level capabilities, the language was designed to encourage cross-platform programming. A standards-compliant C program written with portability in mind can be compiled for a wide variety of computer platforms and operating systems with few changes to its source code.[9]\r\n\r\nSince 2000, C has consistently ranked among the top two languages in the TIOBE index, a measure of the popularity of programming languages.', 'c.svg', '2021-12-25 20:21:04'),
(2, 'C++', 'Programming language', 'second-post', 'C++  is a general-purpose programming language created by Bjarne Stroustrup as an extension of the C programming language, or \"C with Classes\". The language has expanded significantly over time, and modern C++ now has object-oriented, generic, and functional features in addition to facilities for low-level memory manipulation. It is almost always implemented as a compiled language, and many vendors provide C++ compilers, including the Free Software Foundation, LLVM, Microsoft, Intel, Oracle, and IBM, so it is available on many platforms.\r\n\r\nC++ was designed with an orientation toward system programming and embedded, resource-constrained software and large systems, with performance, efficiency, and flexibility of use as its design highlights. C++ has also been found useful in many other contexts, with key strengths being software infrastructure and resource-constrained applications, including desktop applications, video games, servers (e.g. e-commerce, web search, or databases), and performance-critical applications (e.g. telephone switches or space probes).\r\n\r\nC++ is standardized by the International Organization for Standardization (ISO), with the latest standard version ratified and published by ISO in December 2020 as ISO/IEC 14882:2020 (informally known as C++20).[12] The C++ programming language was initially standardized in 1998 as ISO/IEC 14882:1998, which was then amended by the C++03, C++11, C++14, and C++17 standards. The current C++20 standard supersedes these with new features and an enlarged standard library. Before the initial standardization in 1998, C++ was developed by Danish computer scientist Bjarne Stroustrup at Bell Labs since 1979 as an extension of the C language; he wanted an efficient and flexible language similar to C that also provided high-level features for program organization.[13] Since 2012, C++ has been on a three-year release schedule[14] with C++23 as the next planned standard.', 'c++.png', '2021-12-25 20:24:51'),
(3, 'Java', 'High-level programming language', 'third-post', 'Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible. It is a general-purpose programming language intended to let programmers write once, run anywhere (WORA),[17] meaning that compiled Java code can run on all platforms that support Java without the need for recompilation.[18] Java applications are typically compiled to bytecode that can run on any Java virtual machine (JVM) regardless of the underlying computer architecture. The syntax of Java is similar to C and C++, but has fewer low-level facilities than either of them. The Java runtime provides dynamic capabilities (such as reflection and runtime code modification) that are typically not available in traditional compiled languages. As of 2019, Java was one of the most popular programming languages in use according to GitHub,[19][20] particularly for client–server web applications, with a reported 9 million developers.[21]\r\n\r\nJava was originally developed by James Gosling at Sun Microsystems (which has since been acquired by Oracle) and released in 1995 as a core component of Sun Microsystems\' Java platform. The original and reference implementation Java compilers, virtual machines, and class libraries were originally released by Sun under proprietary licenses. As of May 2007, in compliance with the specifications of the Java Community Process, Sun had relicensed most of its Java technologies under the GPL-2.0-only license. Oracle offers its own HotSpot Java Virtual Machine, however the official reference implementation is the OpenJDK JVM which is free open-source software and used by most developers and is the default JVM for almost all Linux distributions.\r\n\r\nAs of October 2021, Java 17 is the latest version. Java 8, 11 and 17 are the current long-term support (LTS) versions. Oracle released the last zero-cost public update for the legacy version Java 8 LTS in January 2019 for commercial use, although it will otherwise still support Java 8 with public updates for personal use indefinitely. Other vendors have begun to offer zero-cost builds of OpenJDK 8 and 11 that are still receiving security and other upgrades.\r\n\r\nOracle (and others) highly recommend uninstalling outdated and unsupported versions of Java, because of serious risks due to unresolved security issues.[22] Oracle advises its users to immediately transition to a supported version, such as one of the LTS versions (8, 11, 17).', 'java.svg', '2021-12-25 20:31:55'),
(4, 'Python', 'High-level programming language', 'fourth-post', 'Python is an interpreted high-level general-purpose programming language. Its design philosophy emphasizes code readability with its use of significant indentation. Its language constructs as well as its object-oriented approach aim to help programmers write clear, logical code for small and large-scale projects.[31]\r\n\r\nPython is dynamically-typed and garbage-collected. It supports multiple programming paradigms, including structured (particularly, procedural), object-oriented and functional programming. It is often described as a \"batteries included\" language due to its comprehensive standard library.[32][33]\r\n\r\nGuido van Rossum began working on Python in the late 1980s, as a successor to the ABC programming language, and first released it in 1991 as Python 0.9.0.[34] Python 2.0 was released in 2000 and introduced new features, such as list comprehensions and a cycle-detecting garbage collection system (in addition to reference counting). Python 3.0 was released in 2008 and was a major revision of the language that is not completely backward-compatible. Python 2 was discontinued with version 2.7.18 in 2020.[35]\r\n\r\nPython consistently ranks as one of the most popular programming languages.', 'python.svg', '2021-12-25 20:40:00'),
(5, 'JavaScript', 'Programming language', 'fifth-post', 'JavaScript  often abbreviated JS, is a programming language that is one of the core technologies of the World Wide Web, alongside HTML and CSS.[11] Over 97% of websites use JavaScript on the client side for web page behavior,[12] often incorporating third-party libraries.[13] All major web browsers have a dedicated JavaScript engine to execute JavaScript on users\' devices.\r\n\r\nJavaScript is a high-level, often just-in-time compiled language that conforms to the ECMAScript standard.[14] It has dynamic typing, prototype-based object-orientation, and first-class functions. It is multi-paradigm, supporting event-driven, functional, and imperative programming styles. It has application programming interfaces (APIs) for working with text, dates, regular expressions, standard data structures, and the Document Object Model (DOM).\r\n\r\nThe ECMAScript standard does not include any input/output (I/O), such as networking, storage, or graphics facilities. In practice, the web browser or other runtime system provides JavaScript APIs for I/O.\r\n\r\nJavaScript engines were originally used only in web browsers, but are now core components of some servers and a variety of applications. The most popular runtime system for this usage is Node.js.\r\n\r\nAlthough Java and JavaScript are similar in name, syntax, and respective standard libraries, the two languages are distinct and differ greatly in design.', 'js.png', '2021-12-25 20:42:52'),
(6, 'Web development', 'web development services industry', 'sixth-post', 'Web development is the work involved in developing a website for the Internet (World Wide Web) or an intranet (a private network).[1] Web development can range from developing a simple single static page of plain text to complex web applications, electronic businesses, and social network services. A more comprehensive list of tasks to which Web development commonly refers, may include Web engineering, Web design, Web content development, client liaison, client-side/server-side scripting, Web server and network security configuration, and e-commerce development.\r\n\r\nAmong Web professionals, \"Web development\" usually refers to the main non-design aspects of building Web sites: writing markup and coding.[2] Web development may use content management systems (CMS) to make content changes easier and available with basic technical skills.\r\n\r\nFor larger organizations and businesses, Web development teams can consist of hundreds of people (Web developers) and follow standard methods like Agile methodologies while developing Web sites. Smaller organizations may only require a single permanent or contracting developer, or secondary assignment to related job positions such as a graphic designer or information systems technician. Web development may be a collaborative effort between departments rather than the domain of a designated department. There are three kinds of Web developer specialization: front-end developer, back-end developer, and full-stack developer. Front-end developers are responsible for behavior and visuals that run in the user browser, while back-end developers deal with the servers.', 'webd.jpg', '2021-12-25 20:48:12'),
(7, 'Machine learning', 'Field of study', 'seventh-post', 'Machine learning (ML) is the study of computer algorithms that can improve automatically through experience and by the use of data.[1] It is seen as a part of artificial intelligence. Machine learning algorithms build a model based on sample data, known as training data, in order to make predictions or decisions without being explicitly programmed to do so.[2] Machine learning algorithms are used in a wide variety of applications, such as in medicine, email filtering, speech recognition, and computer vision, where it is difficult or unfeasible to develop conventional algorithms to perform the needed tasks.[3]\r\n\r\nA subset of machine learning is closely related to computational statistics, which focuses on making predictions using computers; but not all machine learning is statistical learning. The study of mathematical optimization delivers methods, theory and application domains to the field of machine learning. Data mining is a related field of study, focusing on exploratory data analysis through unsupervised learning.[5][6] Some implementations of machine learning use data and neural networks in a way that mimics the working of a biological brain.[7][8] In its application across business problems, machine learning is also referred to as predictive analytics.', 'ml.png', '2021-12-25 20:51:48'),
(8, 'Deep learning', 'subfield of machine learning', 'eighth-post', 'Deep learning (also known as deep structured learning) is part of a broader family of machine learning methods based on artificial neural networks with representation learning. Learning can be supervised, semi-supervised or unsupervised.[1][2][3]\r\n\r\nDeep-learning architectures such as deep neural networks, deep belief networks, deep reinforcement learning, recurrent neural networks and convolutional neural networks have been applied to fields including computer vision, speech recognition, natural language processing, machine translation, bioinformatics, drug design, medical image analysis, material inspection and board game programs, where they have produced results comparable to and in some cases surpassing human expert performance.[4][5][6][7]\r\n\r\nArtificial neural networks (ANNs) were inspired by information processing and distributed communication nodes in biological systems. ANNs have various differences from biological brains. Specifically, artificial neural networks tend to be static and symbolic, while the biological brain of most living organisms is dynamic (plastic) and analogue.[8][9][10]\r\n\r\nThe adjective \"deep\" in deep learning refers to the use of multiple layers in the network. Early work showed that a linear perceptron cannot be a universal classifier, but that a network with a nonpolynomial activation function with one hidden layer of unbounded width can. Deep learning is a modern variation which is concerned with an unbounded number of layers of bounded size, which permits practical application and optimized implementation, while retaining theoretical universality under mild conditions. In deep learning the layers are also permitted to be heterogeneous and to deviate widely from biologically informed connectionist models, for the sake of efficiency, trainability and understandability, whence the \"structured\" part.', 'dl.png', '2021-12-25 20:55:45'),
(9, 'Data science', 'Field of study', 'ninth-post', 'Data science is an interdisciplinary field that uses scientific methods, processes, algorithms and systems to extract knowledge and insights from noisy, structured and unstructured data, and apply knowledge and actionable insights from data across a broad range of application domains. Data science is related to data mining, machine learning and big data.\r\n\r\nData science is a \"concept to unify statistics, data analysis, informatics, and their related methods\" in order to \"understand and analyze actual phenomena\" with data.[3] It uses techniques and theories drawn from many fields within the context of mathematics, statistics, computer science, information science, and domain knowledge. However, data science is different from computer science and information science. Turing Award winner Jim Gray imagined data science as a \"fourth paradigm\" of science (empirical, theoretical, computational, and now data-driven) and asserted that \"everything about science is changing because of the impact of information technology\" and the data deluge.\r\n\r\nA data scientist is someone who creates programming code, and combines it with statistical knowledge to create insights from data.', 'ds.png', '2021-12-25 21:01:23'),
(10, 'Artificial intelligence', 'Field of study', 'tenth-post', 'Artificial intelligence (AI) is intelligence demonstrated by machines, as opposed to natural intelligence displayed by animals including humans. Leading AI textbooks define the field as the study of \"intelligent agents\": any system that perceives its environment and takes actions that maximize its chance of achieving its goals.[a] Some popular accounts use the term \"artificial intelligence\" to describe machines that mimic \"cognitive\" functions that humans associate with the human mind, such as \"learning\" and \"problem solving\", however, this definition is rejected by major AI researchers.[b]\r\n\r\nAI applications include advanced web search engines (e.g., Google), recommendation systems (used by YouTube, Amazon and Netflix), understanding human speech (such as Siri and Alexa), self-driving cars (e.g., Tesla), automated decision-making and competing at the highest level in strategic game systems (such as chess and Go).[2][citation needed] As machines become increasingly capable, tasks considered to require \"intelligence\" are often removed from the definition of AI, a phenomenon known as the AI effect.[3] For instance, optical character recognition is frequently excluded from things considered to be AI,[4] having become a routine technology.[5]\r\n\r\nArtificial intelligence was founded as an academic discipline in 1956, and in the years since has experienced several waves of optimism,[6][7] followed by disappointment and the loss of funding (known as an \"AI winter\"),[8][9] followed by new approaches, success and renewed funding.[7][10] AI research has tried and discarded many different approaches since its founding, including simulating the brain, modeling human problem solving, formal logic, large databases of knowledge and imitating animal behavior. In the first decades of the 21st century, highly mathematical statistical machine learning has dominated the field, and this technique has proved highly successful, helping to solve many challenging problems throughout industry and academia.[11][10]\r\n\r\nThe various sub-fields of AI research are centered around particular goals and the use of particular tools. The traditional goals of AI research include reasoning, knowledge representation, planning, learning, natural language processing, perception, and the ability to move and manipulate objects.[c] General intelligence (the ability to solve an arbitrary problem) is among the field\'s long-term goals.[12] To solve these problems, AI researchers have adapted and integrated a wide range of problem-solving techniques -- including search and mathematical optimization, formal logic, artificial neural networks, and methods based on statistics, probability and economics. AI also draws upon computer science, psychology, linguistics, philosophy, and many other fields.\r\n\r\nThe field was founded on the assumption that human intelligence \"can be so precisely described that a machine can be made to simulate it\".[d] This raises philosophical arguments about the mind and the ethics of creating artificial beings endowed with human-like intelligence. These issues have been explored by myth, fiction, and philosophy since antiquity.[14] Science fiction and futurology have also suggested that, with its enormous potential and power, AI may become an existential risk to humanity.', 'ai.jpg', '2021-12-25 21:04:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
