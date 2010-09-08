
class Demoman
  
  attr_reader :server_address, :player_name, :map, :game, :demo_protocol, :network_protocol, :type, :duration, :ticks, :frames, :sign_on_length
  
  def initialize(file)
    io = File.new(file, "r")
    
    data = io.sysread(4096)
    
    
    demodata = data.unpack("A8/I/I/A260/A260/A260/A260/f/I/I/I/")
    @type = demodata[0]
    @demo_protocol = demodata[1]
    @network_protocol = demodata[2]
    @server_address = demodata[3]
    @player_name = demodata[4]
    @map = demodata[5]
    @game = demodata[6]
    
    @duration = demodata[7]
    @ticks = demodata[8]
    @frames = demodata[9]
    @sign_on_length = demodata[10]
    
    
  end
  
=begin
$ret = array(
		'DemoProtocol'=>$parts['dem'],
		'NetworkProtocol'=>$parts['net'],
		'ServerHost'=>$parts['server'],
		'ClientName'=>$parts['client'],
		'Map'=>$parts['map'],
		'GameDir'=>$parts['dir'],
		'Length'=>$parts['time'],
		'Ticks'=>$parts['ticks'],
		'Frames'=>$parts['frames'],
		'SignOnLength'=>$parts['signon'],
		);
=end  
  
end