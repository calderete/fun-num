class TempConverterController < ApplicationController

	def temp_convert_selector
		render :temp_convert, locals: {temp: @temp, scale: @scale}
	end

	def f_to_c
		temp, scale = params[:temp].to_f, params[:scale].downcase
		case scale
		when "c"
			t, s = 1.8 * temp + 32, "Farenhiet"
			show_answer(temp, scale, t, s)
		when "f"
			t,s = (5.0/9.0)*(temp - 32), "Celsius"
			show_answer(temp, scale, t, s)
		else 
			render json: {message: "#{temp}, or #{scale} is not valid"},
										status: 400 
		end
	end

	def to_k
		temp, scale = params[:temp].to_f, params[:scale].downcase
		case scale
			when "f"
				t, s = (temp - 32) * 5.0/9.0 + 273.15, "Kelvin"
				show_answer(temp, scale, t, s)
			when "c"
				t, s = temp + 273.15, "Kelvin"
				show_answer(temp, scale, t, s)
			else
				render json: {message: "#{temp}, or #{scale} is not valid"},
										status: 400 
		end
	end

	def from_k
		temp, scale = params[:temp].to_f, params[:scale].downcase
		case scale
			when "f"
				t = temp - 273.15 * 9.0/5.0 + 32
				@answer = "#{temp} degrees Kelvin =" + t.to_s + "#{scale}"
				render :temp_answer
			when "c"
				t = temp - 273.15
				@answer = "#{temp} degrees Kelvin =" + t.to_s + "#{scale}"
				render :temp_answer
			else
				render json: {message: "#{temp}, or #{scale} is not valid"},
										status: 400 
		end
	end

	def show_answer(temp, scale, t, s)
		@answer = "#{temp} degrees #{scale} = " + t.to_s + " #{s}"
			render :temp_answer
	end

end










