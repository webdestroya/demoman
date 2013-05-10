module Demoman

  class DemoFile

    attr_reader :server_address, :player_name, :map, :game_dir, :demo_protocol, :network_protocol, :type, :duration, :ticks, :frames, :sign_on_length
    
    def initialize(file=nil)
      
      unless file.nil?
        io = File.new(file, "r")
        data = io.sysread(4096)
        parse_data data
      end
      
    end

    def parse_data(data)
      demodata = data.unpack("A8/I/I/A260/A260/A260/A260/f/I/I/I/")
      @type = demodata[0]
      @demo_protocol = demodata[1]
      @network_protocol = demodata[2]
      @server_address = demodata[3]
      @player_name = demodata[4]
      @map = demodata[5]
      @game_dir = demodata[6]
      
      @duration = demodata[7]
      @ticks = demodata[8]
      @frames = demodata[9]
      @sign_on_length = demodata[10]
      nil
    end
  

  end

end
