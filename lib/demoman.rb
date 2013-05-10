require "demoman/version"
require "demoman/demo_file"

module Demoman
  

  def self.from_file(file)
    io = File.new(file, "r")
    data = io.sysread(4096)
    
    Demoman.from_string(data)
  end
  
  def self.from_string(data)
    demo = DemoFile.new
    demo.parse_data(data)
    demo
  end
  
  
end