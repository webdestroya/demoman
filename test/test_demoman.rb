require 'helper'

class TestDemoman < Test::Unit::TestCase
  should "read demo" do
    demoman = Demoman.new("test/test.dem")
    
    assert_equal "69.90.189.79:27037", demoman.server_address
    assert_equal "Ham Salad[AOF]", demoman.player_name
    assert_equal "dod_jagd", demoman.map
    assert_equal "dod", demoman.game_dir
    assert_equal 3, demoman.demo_protocol
    assert_equal 7, demoman.network_protocol
    
    assert_equal 874, demoman.ticks
    assert_equal 390, demoman.frames
    assert_equal 115449, demoman.sign_on_length
    
    #["HL2DEMO", 3, 7, "69.90.189.79:27037", "Ham Salad[AOF]", "dod_jagd", "dod", 13.2424249649048, 874, 390, 115449]
    
  end
end
