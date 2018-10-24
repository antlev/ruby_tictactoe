
require './Gameboard.rb'
require './Player.rb'
class Game
	@gameboard = GameBoard
	@players = []
	@turnNb
	@activePlayer
  def initialize
  	system "clear"
    @gameboard = GameBoard.new
    setPlayers
    @turnNb = 0
    @activePlayer = 1
  end
  def setPlayers
  	@players = Array.new(2)
  	for i in 1..2
  		@players[i] = Player.new(i)
  	end
  end
	def play
		while (winner = @gameboard.finish) == 0			
			pretty_print
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
	def startup_print
		puts "C'est parti !"
		print_player
		@gameboard.pretty_print
	end		
	def pretty_print
		
		system "clear"
		print_player
		@gameboard.pretty_print
	end
	def print_player
		puts "Tour numéro #{@turnNb+1} - Joueur #{@activePlayer} (#{@players[@activePlayer].getName}) a vous de jouer"
	end
	def newturn
		@turnNb = @turnNb + 1
		loop do
			break if @gameboard.place(askPlayer(@activePlayer), @activePlayer) == 0 
		end
		@activePlayer = (@activePlayer % 2) + 1			
	end
	def askPlayer(playerNb)
		return gets.to_i
	end
end

game = Game.new
game.play
