class TempConverterController < ApplicationController

	def f_to_c
		
		temp = params[:temp].to_f
		scale = params[:scale]
		
		case scale
		when "C", "c"
			f = 1.8 * temp + 32
		when "F", "f"
			c = (5.0/9.0)*(temp - 32)
		else 
			abort "Must be C or F"
		end
		
	end
end
