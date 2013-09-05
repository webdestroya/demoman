require 'spec_helper'

describe Demoman do
  it "read demo" do
    demoman = Demoman::DemoFile.new("spec/data/test.dem")

    demoman.server_address.should eq("69.90.189.79:27037")
    demoman.player_name.should eq("Ham Salad[AOF]")
    demoman.map.should eq("dod_jagd")
    demoman.game_dir.should eq("dod")
    demoman.demo_protocol.should eq(3)
    demoman.network_protocol.should eq(7)
    demoman.type.should eq("HL2DEMO")
    demoman.duration.should eq(13.242424964904785)
    demoman.ticks.should eq(874)
    demoman.frames.should eq(390)
    demoman.sign_on_length.should eq(115449)

    demoman.valid?.should be_true

  end

  it "new style load demo" do

    demoman = Demoman.from_file("spec/data/test.dem")

    demoman.server_address.should eq("69.90.189.79:27037")
    demoman.player_name.should eq("Ham Salad[AOF]")
    demoman.map.should eq("dod_jagd")
    demoman.game_dir.should eq("dod")
    demoman.demo_protocol.should eq(3)
    demoman.network_protocol.should eq(7)

    demoman.ticks.should eq(874)
    demoman.frames.should eq(390)
    demoman.sign_on_length.should eq(115449)

    demoman.valid?.should be_true
  end

  it "read from string" do
    io = File.new("spec/data/test.dem", "r")
    data = io.sysread(4096)

    demoman = Demoman.from_string(data)

    demoman.server_address.should eq("69.90.189.79:27037")
    demoman.player_name.should eq("Ham Salad[AOF]")
    demoman.map.should eq("dod_jagd")
    demoman.game_dir.should eq("dod")
    demoman.demo_protocol.should eq(3)
    demoman.network_protocol.should eq(7)

    demoman.ticks.should eq(874)
    demoman.frames.should eq(390)
    demoman.sign_on_length.should eq(115449)

    demoman.valid?.should be_true

  end

  it "loads a SourceTV demo" do

    demoman = Demoman.from_file("spec/data/sourcetv.dem")

    demoman.server_address.should eq("WebDestroya's Stomping Grounds | MitchDB.com")
    demoman.player_name.should eq("SourceTV Demo")
    demoman.map.should eq("ctf_well")
    demoman.game_dir.should eq("tf")
    demoman.network_protocol.should eq(24)
    demoman.valid?.should be_true
  end

  it 'loads jibberish' do
    demoman = Demoman.from_string("asdasdasdasdasdasdaasdasdasdass")
    demoman.parsed?.should be_true
    demoman.valid?.should be_false

    puts demoman.inspect
  end

end
