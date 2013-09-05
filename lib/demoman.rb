require "demoman/version"
require "demoman/demo_file"

# Handles static creation of {DemoFile} objects
module Demoman


  # Create a {DemoFile} object from a file path
  #
  # @param file [String] the path to the +.dem+ file.
  #
  # @return [DemoFile]
  def self.from_file(file)
    io = File.new(file, "r")
    data = io.sysread(4096)

    Demoman.from_string(data)
  end

  # Create a {DemoFile} object from a raw string
  #
  # @param data [String] the raw demo file data
  #
  # @return [DemoFile]
  def self.from_string(data)
    demo = DemoFile.new
    demo.parse_data(data)
    demo
  end


end