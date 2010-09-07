
class Demoman
  
  def initialize(file)
    io = File.new(file, "r")
    
    data = io.sysread(4096)
    
    
    puts data.unpack("A8/I/I/A260/A260/A260/A260/f/I/I/I/").inspect
    
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