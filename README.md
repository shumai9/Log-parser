# Smart Pension Ruby Test
## Solution to the challenge:

The first thing, I inspect the data in the log file. It appears to follow a file-path format that makes it easier as this eliminated the complexity of formating. Following the inspection, carried out Test-Driven Development (TDD) with RSpec and added gem 'Simplcove' to ensure all code gets tested. After several iterations of red, green and refactor. I arrived in the below solution.
## A first approach by creating a ruby module
```
A module 'ParseUtils' with to class methods 'lib/file_parser.rb'. The first class of that module 'FileParser' is responsible in parsing log data using 'parse_file' class method. The second class 'PageViewsAnalizer' is responsible to carry out functions of counting, sorting & ordering and filtering via class methods namely 'count_page_views', 'sort_page_views' and 'filter_unique_views' to arrive at solution. Except for the 'FileParser' class that expects a path to a file to return an object, all the rest of the class methods accept objects and return objects that can be consumed by front-end applications
```
## After receiving feedback from engineers at Smart pension stating
- Lack of a bit of OOP. 
- You can gain a better understanding of the language if you play around with writing some basic ruby classes.

I rewrote the whole module I created and using ruby classes and creating objects to call methods on them.

A Class 'FileParser'  in 'lib/file_parser.rb' with method 'parse_file '. First, we create an object and initialize it with a path to a file. Then method 'parse_file' is called on the object to get a parsed result which is an object itself.

The second class 'PageViewsAnalizer'  expects an object from 'FileParser' class and is responsible to carry out functions of counting, sorting & ordering and filtering via methods namely 'count_page_views', 'sort_page_views' and 'filter_unique_views' to arrive at solution.

Except for the 'FileParser' class that expects a path to a file to return an object, all the rest of the class 'PageViewsAnalizer' instance methods accept objects and return objects that can be consumed by front-end applications

Finally, to display the result to screen created the app.rb calls all above class methods and prints them to screen as a list.   


## Given instructions:

# Write a ruby program that:

a. Receives a log file path as argument (webserver.log is provided)
> e.g.: app("app/log/webserver.log")

b. Returns the following:
List of webpages with most page views ordered from most pages views to fewer page views
e.g.:
> /home 90 visits
> /index 80 visits
> etc...

List of webpages with most unique page views also ordered e.g.:
> /about/2 8 unique views
> /index 5 unique views
> etc...
