# Manhattan Prep Coding exercise

## Background

In order to test your software development and engineering skills, we would like you to work on a short exercise. After you have submitted your work, we will schedule a time to talk about your code and the decisions you made. Please keep this exercise and code confidential. You may not share it with anyone.

We are developing a corporate code base, which can only grow sustainably, so therefore code quality is very important to us. We highly value _how_ you implement the code.

What we are looking for in your code:
- Use of best-practice software engineering methods
- Readability, extensibility, and maintainability
- Object-oriented principles
- Understanding of the programming language in general

**Please submit your code (zip file) by 3/2/2020 8:00AM to Brian Kennedy. If you need additional time to complete the exercise or have any questions, feel free to reach out and let us know.**

## Task

We have a working, basic command line application with some example data that does not have a lot of functionality yet.
You can use any of the existing code, which is unfortunately far from ideal, so feel free to update it, enhance it, replace it, or delete it -- whatever you think makes it better as long as running it works the same way.

We want you to implement the following features and execute them (please add it to the `run.php/run.rb`) and print some information about the method execution to the command line:

### Assign instructors to their courses
Assign all instructors to their courses (there are already some models and data for it).
In the end, print a message such as `'Instructor [NAME] teaches [COURSE]'`

### Enroll a student into their courses
Enroll all students into their courses (there are already some models and data for it).
Finally, print a message such as `'Student [NAME] enrolled into [COURSE]'`

### Implement messaging between instructors and students
Instructors and students should be able to send and receive messages from each other. A message should have a plain text subject and a body.

#### Constraints/features

- **Instructor to student messaging:**
Let all instructors send a configurable welcome message to all their students.
Output something such as:
`'Instructor [NAME] sent [SUBJECT] message to [STUDENT]'`

- **Student to instructor messaging:**
Any student older than 16 years should be able to send a message directly to their instructors. Students should only be able to send messages to their instructors.
Make 10 different random students send messages to all of their instructors and output something such as:
`'Instructor [NAME] sent [SUBJECT] message to [STUDENT]'`

- **Receiving messages:**
All instructors and students should be able to view their messages at any given time.
Let all instructors and students receive their messages and output:
`'[NAME] received message [SUBJECT] from [NAME] at [DATE_AND_TIME]'`


## How to run it

Just run the application by executing `php run.php` or `ruby run.rb` from within the directory -- it does not require anything special to be set up. Please do **not** introduce any other additional software, such as a database, mail server, or third-party libraries.

**Please submit your code (zip file) by 3/2/2020 8:00AM to Brian Kennedy (BKennedy@manhattanprep.com).  If you need additional time to complete the exercise or have any questions, feel free to reach out and let us know.**
