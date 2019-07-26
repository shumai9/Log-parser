class PageViewsAnalizer
  def initialize(parsed_data)
    @parsed_data = parsed_data
  end

  def count_page_views
    view_count = Hash.new 
    @parsed_data.map do |url, ip_address|
      view_count[url] = ip_address.length 
    end
    return view_count
  end
  def sort_page_views(count_page_views, opt = true)
    sorted = Hash[ 
      count_page_views().sort do |k, v|
        opt ? v[1] <=> k[1] : k[1] <=> v[1]
      end
    ]
  end
  def filter_unique_views(sort_page_views)
    sorted = sort_page_views(count_page_views())
    unique_views = sorted.select do |url,_| 
      url =~ /\/\d/
    end
  end
end
