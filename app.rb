require './lib/file_parser'
require 'benchmark'

path = "log/webserver.log"

Benchmark.bm(20) do |bm|  
	bm.report("Create arr objs & Display:") do
		#created array to save objects
		parsed_data = [ 
			visit_count = ParseUtils::PageViewsAnalizer.count_page_views(
				ParseUtils::FileParser.parse_file(path)
			),
			sort_visited = ParseUtils::PageViewsAnalizer.sort_page_views(visit_count),
			unique_visits = ParseUtils::PageViewsAnalizer.filter_unique_views(sort_visited)
		]
		#created method to display
		def display_views(data_obj)
			data_obj.map{ |k,v| puts "\r\n Visited_Page | Total_Count #{" "*20}\r\n #{k} #{" "*5}:#{" "*10}#{v}" }
		end

		parsed_data.each do |d|
			case d
				when visit_count
					p "Total page visits count"			
				when sort_visited
					p"Ordered total page visits "		
				when unique_visits
					p "Unique page visits"
				else p "It empty"				
			end
			display_views(d)
			p '><'*50
			p d
		end

	end
end

p '@'*100