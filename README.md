# Smart Pension Ruby Test
## Solution to the challenge:

The frist thing, I inspect the data in log file. It appears to follow a file-path format that makes it easier as this illiminated the complexity of formating. Following inspection, carried out Test-Driven Development (TDD) with RSpec. a added gem Simplcove to ensure all code gets tested. After several itrations of red, green and refactor. I arrived in the below solution.
 
A module 'ParseUtils' with to class methods 'lib/file_parser.rb'. The first class of that module 'FileParser' is resposible in parsing log data using 'parse_file' class method. The second class 'PageViewsAnalizer' is resposible to carry out functions of counting, sorting & ordering and filtering via class methods namely 'count_page_views', 'sort_page_views' and 'filter_unique_views' to arrive at solution. Except the 'FileParser' class that expects a path to a file to return an object, all the rest of the class methods accept objects and return objects that can be consumed by front-end applications

Finally, to display the result to screen, the app.rb calls all above class methods and prints them to screen as a list.   


## Given instructions:

# Write a ruby programme that:

a. Receives a log file path as argument (webserver.log is provided)
> e.g.: app("app/log/webserver.log")

b. Returns the following:
List of webpages with most page views ordered from most pages views to less page views
e.g.:
> /home 90 visits
> /index 80 visits
> etc...

List of webpages with most unique page views also ordered e.g.:
> /about/2 8 unique views
> /index 5 unique views
> etc...

