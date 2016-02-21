require 'test_helper'

class DistanceConverterControllerTest < ActionController::TestCase
  test "from_lightyears" do
  	post :from_ly, {distance: 2.5, scale: "m"}
    assert d = 14664240000000.0
  end

  test "from_au" do
  	distance = 82
  	scale = "m"
  	  assert d = 7622720000.0
  	distance = 76
  	scale = "k"
  		assert d = 11369600000.0
  	end

  test "from_parsec" do
  	distance = 12
  	scale = "m"
  		assert d = 230088000000000.0
  	distance = 12
  	scale = "k"
  		assert d = 370320000000000.0
  	distance = 12
  	scale = "ly"
  		assert d = 39.187
  	distance = 12
  	scale = "au"
  		assert d = 2475120.0
  end
end
