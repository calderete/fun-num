class DistanceConverterController < ApplicationController

	def distance_selector
		render :distance_convert, locals: {distance: @distance, scale: @scale}
	end

	def from_lightyears
		distance, scale = params[:distance].to_f, params[:scale].downcase
		case scale
			when "m"
				d = distance * 5865696e6
				@answer = "#{distance} lightyears is " + d.to_s + "Miles"
				render :answer
			when "k"
				d = distance * 94608e8
				@answer = "#{distance.to_i} lightyears is " + d.to_s + "Kilometers"
				render :answer
			else
				render json: {message: "#{distance} or #{scale} is not valid"}
		end
	end

	def from_au
		distance, scale = params[:distance].to_f, params[:scale].downcase
		case scale
			when "m"
				d = distance * 9296e7
				@answer = "#{distance} astronimcal units is" + d.to_s + "Miles"
				render :answer
			when "k"
				d = distance * 1496e8
				@answer = "#{distance} astronimcal units is " + d.to_s + "Kilometers"
			end
	end

	def from_parsec
		distance, scale = params[:distance].to_f, params[:scale].downcase
		case scale 
		when "m"
			d = distance * 1.9174e13
			@answer = "#{distance} parsecs is " + d.to_s + "Miles"
			render :answer
		when "k" 
			d = distance * 3.086e13
			@answer = "#{distance} parsecs is " + d.to_s + "Miles"
			render :answer
		when "ly"
			d = distance * 3.2656
			@answer = "#{distance} parsecs is " + d.to_s + "Miles"
			render :answer
		when "au"
			d = distance * 2.0626e5
			@answer = "#{distance} parsecs is " + d.to_s + "Miles"
			render :answer
		end			
	end

	

end
















