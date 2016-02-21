require 'test_helper'

class TempConverterControllerTest < ActionController::TestCase
  test "f_to_c" do
    scale = "f"
  	temp = 32
      assert t = 0
      assert s = "Celsius"
    scale = "C"
   	temp = 0
   	  assert t = 32
   	  assert s = "Farenhiet"
  end

  test "to_k" do
  	scale = "c"
  	temp = 40
  		assert t = 313.15
  		assert s = "Kelvin"
  	scale = "f"
  	temp = 40
  		assert t = 277.594
  		assert s = "Kelvin"
  end

  test "from_k" do 
  	scale = "c"
  	temp = 313.15
  	  assert t = 40
  	  assert s = "Celsius"
  	scale = "f"
  	temp = 277.594
  		assert t = 40
  		assert s = "Farenhiet"
  end

end
