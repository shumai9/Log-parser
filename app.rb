require './lib/file_parser'
require 'benchmark'


path = "log/webserver.log"
def app(path)
	#parse and get count
	#show visted pages in order (desc or asc)
	#show uinique views in order
end

# The 20 is the width of the first column in the output.
Benchmark.bm(20) do |bm|  
	bm.report("var not created:") do 
		puts "Number of visits counted \r\n #{
			ParseUtils::PageViewsAnalizer.count_page_views(
				ParseUtils::FileParser.parse_file(path)
			)
		}"
	end
end
Benchmark.bm(20) do |bm|
	bm.report("Read and parse log:") do
		puts "Page visits sorted in decsending order \r\n #{
			ParseUtils::PageViewsAnalizer.sort_page_views(
				ParseUtils::PageViewsAnalizer.count_page_views(
					ParseUtils::FileParser.parse_file(path)
				)
			)            
		}"
	end
end
Benchmark.bm(20) do |bm|
	bm.report("Read and parse log:") do
		puts "Unique page views \n #{
			ParseUtils::PageViewsAnalizer.filter_unique_views(
				ParseUtils::PageViewsAnalizer.sort_page_views(
					ParseUtils::PageViewsAnalizer.count_page_views(
						ParseUtils::FileParser.parse_file(path)
					)
				)
			)
		}"
	end
end