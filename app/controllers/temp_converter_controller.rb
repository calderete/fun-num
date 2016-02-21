class TempConverterController < ApplicationController

	def temp_convert_selector
		render :temp_convert
	end

	def f_to_c
		temp, scale = params[:temp].to_f, params[:scale].downcase
		case scale
		when "c"
			f = 1.8 * temp + 32
			render json: {message: "#{f} degrees C"}, status: 200
		when "f"
			c = (5.0/9.0)*(temp - 32)
			render json: {message: "#{c} degrees F"}, status: 200
		else 
			render json: {message: "#{temp}, or #{scale} is not valid"},
										status: 400 
		end
	end

	def to_k
		temp, scale = params[:temp].to_f, params[:scale].downcase
		case scale
			when "f"
				f2k = (temp - 32) * 5.0/9.0 + 273.15
				render json: { message:"#{f2k} degrees Kelvin"}, status: 200
			when "c"
				c2k = temp + 273.15
				render json: {message: "#{c2k} degrees Kelvin"}, status: 200
			else
				render json: {message: "#{temp}, or #{scale} is not valid"},
										status: 400 
		end
	end

	def from_k
		temp, scale = params[:temp].to_f, params[:scale].downcase
		case scale
			when "f"
				k2f = temp - 273.15 * 9.0/5.0 + 32
				render json: {message: "#{k2f} degrees F"}
			when "c"
				k2c = temp - 273.15
				render json: {message: "#{k2c} degrees C"}
			else
				render json: {message: "#{temp}, or #{scale} is not valid"},
										status: 400 
		end
	end
end










