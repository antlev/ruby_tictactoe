
require './Gameboard.rb'
class Game
	@gameboard = GameBoard
	@player1
	@player2
	@turnNb
	@activePlayer
  def initialize
    @gameboard = GameBoard.new
    # setPlayers
    @turnNb = 0
    @activePlayer = 1
  end
  def setPlayers
  	puts "Quel est le nom du joueur 1"
  	@player1 = gets
  	puts "Quel est le nom du joueur 2"
  	@player2 = gets
  end
	def play
		@gameboard.pretty_print
		while (winner = @gameboard.finish) == 0
			newturn
			if @turnNb == 9
				if (winner = @gameboard.finish) == 0
					puts "C'est une égalité"
				else
					puts "Player #{winner} won !"
				end
				break
			end
		end		
	end
	def newturn
		@turnNb = @turnNb + 1
		loop do
			break if @gameboard.place(askPlayer(@activePlayer), @activePlayer) == 0 
		end
		@activePlayer = (@activePlayer % 2) + 1			
	end
	def askPlayer(playerNb)
		puts "Joueur #{playerNb} a vous de jouer"
		return gets.to_i
	end
end

game = Game.new
game.play
