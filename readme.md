# MySQL Database Learning Journey

**A Comprehensive MySQL Database Learning Repository**

*Author: Teslim Adeyanju*  
*Repository: 02-study-mysql-database*

---

## Overview

This repository represents a comprehensive and structured learning journey through MySQL database concepts, from fundamental database operations to advanced data analysis techniques. The content is organized into six distinct learning tracks, each building upon previous knowledge and providing hands-on experience with real-world database scenarios.

## Learning Objectives

By the end of this learning journey, you will have mastered:

- **Core MySQL Fundamentals**: Database creation, table management, and basic queries
- **Advanced Query Techniques**: Complex joins, subqueries, and window functions
- **Data Manipulation**: INSERT, UPDATE, DELETE operations with best practices
- **Function Mastery**: String, date, numeric, and control flow functions
- **Data Analysis**: Time series analysis, statistical functions, and reporting
- **Performance Optimization**: Query optimization, indexing, and execution planning
- **Real-world Applications**: Practical data analysis projects and case studies

---

## Learning Path Structure

### **Track 1: DataCamp MySQL Foundation**
*Location: `1-Mysql_Data_Camp/`*

A structured curriculum following DataCamp's progressive learning approach:

#### **Module 1: Introduction to SQL**
- **Relational Databases Fundamentals** (`chapter1-Relational Databases.pdf`)
  - Database design principles
  - Entity-relationship modeling
  - Normalization concepts
- **Querying Essentials** (`chapter2-Querying.pdf`)
  - SELECT statements
  - Filtering and sorting data
  - Basic aggregations

#### **Module 2: Intermediate SQL**
- **Data Selection Mastery** (`intermediate-sql1-Selecting Data.pdf`)
- **Advanced Filtering** (`intermediate-sql2-Filtering Records.pdf`)
- **Aggregate Functions** (`intermediate-sql3-Aggregate Functions.pdf`)
- **Sorting and Grouping** (`intermediate-sql4-Sorting and Grouping.pdf`)

#### **Module 3: Joining Data**
- **Inner Joins Fundamentals** (`chapter1-Introducing Inner Joins.pdf`)
- **Outer, Cross, and Self Joins** (`chapter2-Outer, Cross, and Self Joins.pdf`)
- **Set Theory for SQL Joins** (`chapter3-Set Theory for sql joins.pdf`)
- **Subqueries Deep Dive** (`chapter4-Subqueries.pdf`)
- **Practical Implementation** (`joining-data-code.ipynb`)
  - Python-MySQL integration
  - Real-world join scenarios
  - Data visualization of query results

#### **Module 4: Data Manipulation**
- **CASE Statements** (`CASE.mysql-notebook`, `chapter1-Intro to CASE.pdf`)
- **Subquery Mastery** (`chapter2-Short and Simple Subqueries.pdf`)
- **Correlated Queries** (`chapter3-Correlated Queries.pdf`)
- **Window Functions** (`chapter4-Window Function.pdf`)

#### **Module 5: Window Functions**
- **Window Function Fundamentals** (`chapter1-windowfunction.pdf`)
- **Advanced Window Operations** (`chapter2-window-function.pdf`)
- **Practical Applications** (`chapter3.pdf`, `chapter4-2.pdf`)

#### **Module 6: Functions and Data Types**
- **Data Types Overview** (`chapter1-Overview of Common Data Types.pdf`)
- **Date-Time Functions** (`chapter2-DATE-TIME.pdf`)
- **Advanced Function Applications** (`chapter3.pdf`, `chapter4-2.pdf`)

#### **Module 7: Statistical Analysis**
- **Intro to Statistics** (`chapter2.pdf`)

#### **Module 8: Exploratory Data Analysis**
- **EDA Fundamentals** (Multiple chapters)
- **Entity Relationship Diagrams** (`erdiagram.png`)

#### **Module 9: Data-Driven Decision Making**
- **Decision Framework** (`chapter1.pdf`, `chapter3.pdf`)

---

### **Track 2: Comprehensive MySQL Tutorial**
*Location: `2-Mysql_Tutorial_Class/`*

A thorough tutorial series covering MySQL from basics to advanced concepts:

#### **Basic Modules**

1. **MySQL Introduction** (`Module 1-Mysql-Intro.sql`)
   - Database connection and setup
   - Basic SELECT operations
   - Subqueries with comparison operators
   - EXISTS and NOT EXISTS operations
   - Variable assignments and operations

2. **MySQL Joining** (`Module 2-Mysql-Joining.sql`)
   - Column and table aliases
   - INNER JOIN implementations
   - LEFT JOIN operations
   - Self joins for hierarchical data
   - CROSS JOIN applications

3. **Grouping Data** (`Module 3-MySql-Grouping-Data.sql`)
   - GROUP BY fundamentals
   - Date-based grouping
   - Aggregate function applications
   - Statistical calculations

4. **Subqueries** (`Module 4-Mysql-Subqueries.sql`)
   - Nested query structures
   - Correlated subqueries
   - EXISTS operations
   - Performance considerations

5. **Working with SQL Tables** (`Module 7-Mysql-Working-with-Sql-Tables.sql`)
   - Table creation and modification
   - Constraints and indexes
   - Temporary tables
   - Generated columns
   - ALTER TABLE operations

#### **Function Modules**

1. **Aggregate Functions** (`Module 1-MySQL-Aggregate-Functions.sql`)
   - COUNT, SUM, AVG, MIN, MAX
   - GROUP BY with aggregates
   - Customer analysis examples

2. **Control Flow Functions** (`Module 3-MySQL-Control-Flow-Functions-and-Expressions.sql`)
   - IF statements and conditional logic
   - IFNULL for handling NULL values
   - CASE expressions
   - Contact management examples

3. **Date Functions** (`Module 4-MySQL Date Functions.sql`)
   - Date extraction functions
   - Date formatting and manipulation
   - Time-based analysis
   - Order date analytics

4. **String Functions** (`Module 5-MySQL String Functions.sql`)
   - INSTR and pattern matching
   - String concatenation
   - LIKE operations with indexing
   - Character set considerations
   - Performance optimization

---

### **Track 3: Practical Database Operations**
*Location: `3-DbVisualizer_query/`*

Real-world query examples and database operations:

- **Subqueries Practice** (`mysql_subqueries_note.sql`)
- **Consumer Complaint Analysis** (`consumer-compliant-table-extraction.sql`)
- **DataCamp Exercise Solutions** (Multiple chapter files)
- **Function Implementation** (`mysql-function-note.sql`)
- **Database Normalization** (`normalisation.sql`)
- **Super Data Science Projects** (`superdatascience_sql.sql`)

---

### **Track 4: SQL Data Analysis with Cathy Tanumura**
*Location: `4-SQL-Data-Analysis-Cathy-Tanumura/`*

Advanced data analysis techniques focusing on time series and retail analytics:

#### **Time Series Analysis** (`chapter3-Time Series Analysis.sql`)
- **Date and Timestamp Operations**
  - Current date/time functions
  - Date truncation and formatting
  - Date part extraction
  - Custom date creation

- **Date Mathematics**
  - Date arithmetic operations
  - Interval calculations
  - Period comparisons

#### **Retail Sales Analysis**
- **Dataset**: US Retail Sales (`us_retail_sales-2.csv`)
- **Jupyter Integration** (`notebook.ipynb`)
- **Practical Applications**:
  - Sales trend analysis
  - Seasonal pattern identification
  - Performance metrics calculation

---

### **Track 5: 24-Hour SQL Intensive**
*Location: `5-Learn 24hoursSQL/`*

Rapid-fire SQL learning with focused exercises:

- **Chapters 1-2**: Data Retrieval Fundamentals (`chapter 1-2 questions.sql`)
  - SELECT operations
  - DISTINCT usage
  - Basic filtering

- **Chapter 3**: Advanced Querying (`chapter 3questions.sql`)
  - Complex WHERE clauses
  - Price range filtering
  - Pattern matching

---

### **Track 6: SQL for Data Analytics with Luke**
*Location: `6-SQL-for-Data-Analytics-Luke/`*

Python-integrated SQL analytics with comprehensive tooling:

#### **Environment Setup**
- **Requirements** (`requirements.txt`): 134 packages including:
  - Jupyter ecosystem (jupyter, ipykernel, notebook)
  - Data analysis (pandas, numpy, matplotlib, seaborn)
  - Database connectivity (mysql-connector-python)
  - Web frameworks (fastapi, flask)
  - Machine learning tools (scikit-learn)

#### **Analytics Notebook** (`notebook.ipynb`)
- Python-SQL integration patterns
- Data visualization techniques
- Statistical analysis workflows

---

## Key Learning Outcomes

### **Technical Skills Mastered**

#### **1. Query Fundamentals**
- SELECT statements with complex filtering
- JOIN operations (INNER, LEFT, RIGHT, CROSS, SELF)
- Subqueries and correlated queries
- Window functions and analytical operations

#### **2. Data Manipulation**
- INSERT, UPDATE, DELETE operations
- Transaction management
- Data validation and constraints
- Bulk operations and performance optimization

#### **3. Function Expertise**
- **String Functions**: CONCAT, SUBSTRING, REPLACE, INSTR
- **Date Functions**: DATE_FORMAT, DATEDIFF, DATE_ADD
- **Aggregate Functions**: COUNT, SUM, AVG, MIN, MAX
- **Control Flow**: IF, CASE, IFNULL

#### **4. Advanced Concepts**
- Common Table Expressions (CTEs)
- Recursive queries
- Stored procedures and functions
- Indexing and performance optimization

#### **5. Data Analysis**
- Time series analysis
- Statistical calculations
- Trend identification
- Business intelligence reporting

### **Practical Applications**

#### **Business Scenarios Covered**
- **Customer Analysis**: Segmentation, lifetime value, behavior patterns
- **Sales Analytics**: Performance tracking, trend analysis, forecasting
- **Inventory Management**: Stock analysis, reorder points, demand planning
- **Financial Reporting**: Revenue analysis, profit margins, cost analysis

#### **Industry-Relevant Skills**
- **E-commerce Analytics**: Order processing, customer journey analysis
- **Retail Analytics**: Sales performance, seasonal trends, product analysis
- **Business Intelligence**: KPI development, dashboard creation, reporting

---

## Technical Environment

### **Database Setup**
- **Primary Database**: ClassicModels (Sample MySQL Database)
- **Connection Details**: Local MySQL server (localhost:3306)
- **Tools Used**:
  - DbVisualizer for query development
  - MySQL Workbench for database management
  - Jupyter Notebooks for analysis integration

### **Development Stack**
- **Database**: MySQL 8.0+
- **Programming**: Python 3.x with MySQL integration
- **Analysis Tools**: Pandas, NumPy, Matplotlib, Seaborn
- **Notebooks**: Jupyter Lab/Notebook environment
- **Version Control**: Git with structured commit history

---

## Repository Navigation Guide

```
2-Mainclass-Mysql/
├── README.md (This comprehensive guide)
├── users-guide.pdf (Additional documentation)
├──
├── 1-Mysql_Data_Camp/           # Structured learning curriculum
│   ├── 1-Introduction-sql/      # SQL fundamentals
│   ├── 2-intermediate sql/      # Intermediate concepts
│   ├── 3-joining data/          # JOIN operations
│   ├── 4-Data Manipulation/     # Data modification
│   ├── 5-WindowFunction/        # Window functions
│   ├── 6-Functions/             # MySQL functions
│   ├── 07-Intro to Statistics/  # Statistical analysis
│   ├── 08-Exploratory data/     # EDA techniques
│   └── 09-Data-Driven/          # Decision making
│
├── 2-Mysql_Tutorial_Class/      # Comprehensive tutorials
│   ├── 1-Mysql-Basic-Module/    # Core concepts
│   └── 2-Mysql-Function-Module/ # Function mastery
│
├── 3-DbVisualizer_query/        # Practical operations
├── 4-SQL-Data-Analysis-Cathy/   # Advanced analytics
├── 5-Learn 24hoursSQL/          # Intensive learning
└── 6-SQL-for-Data-Analytics/    # Python integration
```

---

## Getting Started

### **Prerequisites**
1. MySQL Server 8.0+ installed and running
2. Python 3.7+ with pip package manager
3. Git for version control
4. Text editor or IDE (VS Code recommended)

### **Setup Instructions**

1. **Clone the Repository**
   ```bash
   git clone https://github.com/TeslimAdeyanju/02-study-mysql-database.git
   cd 02-study-mysql-database
   ```

2. **Database Setup**
   - Install MySQL Server
   - Import the ClassicModels sample database
   - Verify connection: `mysql -u root -p`

3. **Python Environment** (for analytics tracks)
   ```bash
   cd 6-SQL-for-Data-Analytics-Luke/
   pip install -r requirements.txt
   jupyter notebook
   ```

4. **Start Learning**
   - Begin with `1-Mysql_Data_Camp/1-Introduction-sql/`
   - Follow the structured progression
   - Practice with provided examples
   - Experiment with your own queries

---

## Recommended Learning Path

### **Phase 1: Foundation (Weeks 1-2)**
1. Start with DataCamp Introduction to SQL
2. Complete basic MySQL tutorial modules 1-3
3. Practice fundamental SELECT operations

### **Phase 2: Intermediate (Weeks 3-4)**
1. Master JOIN operations from multiple sources
2. Explore subqueries and aggregate functions
3. Complete intermediate SQL modules

### **Phase 3: Advanced (Weeks 5-6)**
1. Window functions and advanced analytics
2. Function mastery across all categories
3. Time series analysis techniques

### **Phase 4: Practical Application (Weeks 7-8)**
1. Work through DbVisualizer query examples
2. Complete data analysis projects
3. Python-SQL integration exercises

---

## Assessment and Progress Tracking

### **Knowledge Checkpoints**
- [ ] Basic SELECT and filtering operations
- [ ] All types of JOIN operations
- [ ] Subquery implementations
- [ ] Aggregate and window functions
- [ ] Date and string manipulation
- [ ] Data modification operations
- [ ] Performance optimization techniques
- [ ] Real-world data analysis projects

### **Practical Projects Completed**
- [ ] Customer segmentation analysis
- [ ] Sales performance reporting
- [ ] Time series trend analysis
- [ ] Inventory management queries
- [ ] Financial performance metrics

---

## Best Practices Learned

### **Query Optimization**
- Proper indexing strategies
- Efficient JOIN operations
- Subquery vs JOIN performance considerations
- EXPLAIN plan analysis

### **Code Organization**
- Consistent formatting and indentation
- Meaningful aliases and comments
- Modular query design
- Version control for SQL scripts

### **Data Analysis**
- Exploratory data analysis workflows
- Statistical validation techniques
- Visualization integration
- Performance monitoring

---

## Contributing and Collaboration

This repository represents personal learning progress, but contributions are welcome:

1. **Bug Reports**: Issues with SQL syntax or logic
2. **Enhancements**: Additional examples or exercises
3. **Documentation**: Improvements to explanations
4. **New Content**: Relevant learning materials

---

## Contact and Support

**Teslim Adeyanju**
- Email: info@adeyanjuteslim.co.uk
- GitHub: [@TeslimAdeyanju](https://github.com/TeslimAdeyanju)
- LinkedIn: [Teslim Adeyanju](https://linkedin.com/in/teslimadenrele)

---

## License and Usage

This educational repository is available for learning purposes. Please provide appropriate attribution when using materials for educational or professional development.

---

## Acknowledgments

- **DataCamp**: Structured SQL curriculum and progressive learning approach
- **MySQL Tutorial**: Comprehensive examples and practical applications
- **Cathy Tanumura**: Advanced data analysis techniques and time series methods
- **Luke**: Python-SQL integration patterns and analytics workflows
- **ClassicModels Database**: Excellent sample dataset for learning

---

*"The journey of a thousand queries begins with a single SELECT statement."*

**Happy Learning!**