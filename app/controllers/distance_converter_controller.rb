class DistanceConverterController < ApplicationController

	def distance_selector
		render :distance_convert, locals: {distance: @distance, scale: @scale}
	end

	def from_lightyears
		unless params[:distance].to_f == 0
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
					render json: {message: "#{scale} is invalid go back and enter 'm' or 'k'"},
											status: 400
			end
		else
			render json: {message: "invalid distance"}
		end
	end

	def from_au
		unless params[:distance].to_f == 0
			distance, scale = params[:distance].to_f, params[:scale].downcase
			case scale
				when "m"
					d = distance * 9296e7
					@answer = "#{distance} astronimcal units is" + d.to_s + "Miles"
					render :answer
				when "k"
					d = distance * 1496e8
					@answer = "#{distance} astronimcal units is " + d.to_s + "Kilometers"
				else
					render json: {message: "#{scale} is invalid. Go back and enter 'm' or 'k'"},
											status: 400
				end
		else
			render json: {message: "invalid distance"}
		end
	end

	def from_parsec
		unless params[:distance].to_f == 0
			distance, scale = params[:distance].to_f, params[:scale].downcase
			case scale 
			when "m"
				d = distance * 1.9174e13
				@answer = "#{distance} parsecs is " + d.to_s + "Miles"
				render :answer
			when "k" 
				d = distance * 3.086e13
				@answer = "#{distance} parsecs is " + d.to_s + "Kilometers"
				render :answer
			when "ly"
				d = distance * 3.2656
				@answer = "#{distance} parsecs is " + d.to_s + "Lightyears"
				render :answer
			when "au"
				d = distance * 2.0626e5
				@answer = "#{distance} parsecs is " + d.to_s + "AU"
				render :answer
			else
				render json: {message: "#{scale} is invalid. Go back and enter 'm' or 'k'"},
										status: 400
			end
		else
			render json: {message: "invalid distance"}
		end			
	end
end
















