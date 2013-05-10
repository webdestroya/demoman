require "demoman/version"
require "demoman/demo"

module Demoman
  

  def self.from_file(file)
    io = File.new(file, "r")
    data = io.sysread(4096)
    
    Demoman.from_string(data)
  end
  
  def self.from_string(data)
    demoman = Demo.new
    demoman.parse_data(data)
    demoman
  end
  
  
end