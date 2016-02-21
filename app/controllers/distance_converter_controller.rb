class DistanceConverterController < ApplicationController

	def distance_selector
		render :distance_convert, locals: {distance: @distance, scale: @scale}
	end

	def from_lightyears
		distance, scale = params[:distance].to_f, params[:scale].downcase
		case scale
			when "m"
				d = distance * 5865696000000
				@answer = "#{distance} lightyears is " + d.to_s + "Miles"
				render :answer
			when "k"
				d = distance * 9460800000000
				@answer = "#{distance} lightyears is " + d.to_s + "Kilometers"
				render :answer
			else
				render json: {message: "#{distance} or #{scale} is not valid"}
		end
	end

end
