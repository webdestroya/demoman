module Demoman

  # Parses and provides data about a Half life demo file.
  #
  # @see https://developer.valvesoftware.com/wiki/DEM_Format
  class DemoFile


    # If recorded by a client, then this will be the +IPAddress:Port+ of 
    # the server.
    #
    # If recorded by SourceTV then this will be the hostname of the server.
    #
    # @return [String]
    attr_reader :server_address

    # The name of the player recording the demo.
    # 
    # If recorded by SourceTV it will be the name of the SourceTV player.
    #
    # @return [String]
    attr_reader :player_name

    # The current map on the server
    #
    # @return [String]
    attr_reader :map

    # The game directory as reported by the server.
    # Examples: +tf+, +dod+, etc.
    #
    # @return [String]
    attr_reader :game_dir

    # This is the demo protocol version.
    # This is almost always +3+
    #
    # @return [Integer]
    attr_reader :demo_protocol

    # This is the network protocol, which varies by game.
    #
    # @return [Integer]
    attr_reader :network_protocol

    # The type of demo. This is usually +HL2DEMO+
    #
    # @return [String]
    attr_reader :type

    # This is the duration of the demo, in seconds.
    #
    # @return [Float]
    attr_reader :duration

    # This is the number of server ticks that occurred.
    # This is roughly the tick rate of the server multiplied by the duration.
    #
    # @return [Integer]
    attr_reader :ticks

    # The number of frames in the demo
    #
    # @return [Integer]
    attr_reader :frames

    # Length of the signon data (Init for first frame)
    #
    # @return [Integer]
    attr_reader :sign_on_length

    # Initialize a {DemoFile} object.
    # If the +file+ parameter is provided, then the file is read and parsed.
    #
    # @param file [String] path to a demo file
    def initialize(file=nil)
      @demodata = nil
      unless file.nil?
        io = File.new(file, "r")
        data = io.sysread(4096)
        parse_data data
      end

    end

    # Parses the demo file header.
    #
    # @param data [String] the raw demo file header data.
    #
    # @return [void]
    def parse_data(data)
      @demodata = nil
      #                        0 1 2 3    4    5    6    7 8 9 10
      @demodata = data.unpack("A8/I/I/A260/A260/A260/A260/f/I/I/I/")
      @type = @demodata[0]
      @demo_protocol = @demodata[1]
      @network_protocol = @demodata[2]
      @server_address = @demodata[3]
      @player_name = @demodata[4]
      @map = @demodata[5]
      @game_dir = @demodata[6]

      @duration = @demodata[7]
      @ticks = @demodata[8]
      @frames = @demodata[9]
      @sign_on_length = @demodata[10]
      
      return self
    end


    # Returns if the demo has been parsed.
    # *Note:* This does not check if the demo was valid.
    #
    # @see #valid?
    #
    # @since 2.0.2
    #
    # @return [Boolean] true
    def parsed?
      !@demodata.nil?
    end

    # Returns whether or not the parsed demo is considered valid.
    #
    # *Note:* This is a somewhat _educated_ guess. As long as the 
    # values appear to be within a specific range, then the demo
    # is assumed to be valid.
    #
    # @since 2.0.2
    #
    # @return [Boolean]
    def valid?
      return false unless self.parsed?

      return false unless @demodata.compact.size == 11

      return false unless @type.eql?('HL2DEMO')

      true
    end

  end

end
