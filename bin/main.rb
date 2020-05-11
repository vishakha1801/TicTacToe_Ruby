#!/usr/bin/env ruby

require_relative '../lib/board.rb'
require_relative '../lib/TicTacToe.rb'

game = TicTacToe.new
puts game.display_board

play = true
while play
  for i in (1..2)
    player = i

    loop do
      puts("\nPlayer #{i} make your move\n(Choice between 1-9):")
      choice = STDIN.gets.chomp.to_i

      if game.valid_input?(choice, player)
        if !game.occupied?(choice)
          game.update(choice, player)
          puts game.display_board
          break
        else
          puts "\nSpot already taken, try another"
        end
      end
    end

    if game.win?(player)
      play = false
      puts("\nWin! Congratulations Player #{player}")
      break
    elsif game.full?
      play = false
      puts("\nDraw, due full board")
      break
    end
  end
end
