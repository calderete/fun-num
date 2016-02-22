class LevenshteinController < ApplicationController

	def compare
		s1 = params[:s1]
		s2 = params[:s2]
		distance = levenshtein(s1, s2)
		@answer = "The levenshtein distance between #{s1} and #{s2} is #{distance}"
		render :answer
	end

	def levenshtein(s1, other, ins=2, del=2, sub=1)
		
		dm = []
		dm[0] = (0..s1.length).collect { |i| i * ins }
		fill = [0] * (s1.length - 1)

		for i in 1..other.length
			dm[i] = [i * del, fill.flatten]
		end

		for i in 1..other.length
			for j in 1..s1.length
				dm[i][j] = [
						  dm[i - 1][j - 1] +
						     (s1[j - 1] == other[i - 1] ? 0 : sub),
					  	     dm[i][j - 1] + ins,
					  	dm[i - 1][j] + del
				].min
			end
		end

		dm[other.length][s1.length]
	end

end
