class TicTacToe < Board
	def valid_input?(choice,player)
		choice.between?(1,9) && player.between?(1,2)
	end

	def occupied?(choice)
		@field[choice-1] == 'x' || @field[choice-1] == 'o'
	end

	def win?(player)
		mark = (player == 1 ? 'x' : 'o')
	   @win_array.each do |sub_array|
	      return true if sub_array.all? { |element| @field[element] == mark }
	    end
	    false
	end 

	def full?
		return true if @field.none?(Numeric)

		false
	end

end