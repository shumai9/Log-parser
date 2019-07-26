class FileParser
  def initialize(log_file_path)
    @log_file_path = log_file_path
  end

  def parse_file
    data = Hash.new { |hash, key| hash[key] = [] }
    if File.exist? @log_file_path
      log_file = File.open(@log_file_path, 'r')
      while line = log_file.gets 
        url, ip_address = line.split(' ')
        data[url] << ip_address
      end   
      return data
    end
    return nil
  end
end