require './lib/file_parser'
require './lib/parsed_analizer'
require 'benchmark'

path = "log/webserver.log"
# performance with large log data
#  user     system      total        real
#  0.547252   0.023290   0.570542 (  0.571376)
path_dummy = "log/dummy.log"
# performance with small log data
#  user     system      total        real
#  0.000700   0.000204   0.000904 (  0.001105)

Benchmark.bm(20) do |bm|  
	bm.report("Create arr objs & Display:") do
		#created array to save objects
		log_obj = FileParser.new(path)
		parsed_data = log_obj.parse_file
		analzed_obj = PageViewsAnalizer.new(parsed_data)
		parsed_data = [ 
			visit_count = analzed_obj.count_page_views,
			sorted_views = analzed_obj.sort_page_views(visit_count),
			unique_visits = analzed_obj.filter_unique_views(sorted_views)
		]
		def display_views(data_obj)
			data_obj.map{ |k,v| puts "\r\n Visited_Page | Total_Count #{" "*20}\r\n #{k} #{" "*5}:#{" "*10}#{v}" }
		end

		parsed_data.each do |d|
			case d
				when visit_count
					p "Total page visits count"			
				when sorted_views
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