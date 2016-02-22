class NumberTestController < ApplicationController

	def test_selector
		render :number_test
	end

	def happy_test
		unless params[:number].to_f == 0
			n = params[:number]
			counter = 0
			until n == 1 || n == 4
				n_split = n.to_s.chars.map(&:to_i)
				sq_arry = []
				n_split.map do |n|
					squares = n ** 2
					sq_arry.push(squares)
				end
			n = sq_arry.reduce(:+)
			counter += 1
			end
			if n == 1
				@result = "#{params[:number]} is a Happy number and reduced to 1 in #{counter} trys"
				render :result
			elsif n == 4
				@result = "#{params[:number]} is an Unhappy number and reduced to 4 in #{counter} trys"
				render :result
			else 
				render json: {message: "I have no idea how to deal with this"}
			end
		else
			render json: {message: "invalid number"}
		end
	end
end
