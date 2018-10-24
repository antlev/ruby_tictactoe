
require './Gameboard.rb'
require './Player.rb'
class Game
	@gameboard = GameBoard
	@players
	@turnNb
	@playerNb
	@player1
	@player2
	@activePlayer
  def initialize
  	system "clear"
    @gameboard = GameBoard.new
    @players = Array.new
    @turnNb = 0
		@playerNb = 0
		@player1 = -1
		@player2 = -1
    @activePlayer = 1
  end
  def menu
  	if @player1 != -1
  		@player1.print_player
  	end
  	if @player2 != -1
  		@player2.print_player
  	end
  	puts "1) Créer un nouveau joueur"  	
  	puts "2) Sélèctionner un joueur"  	
  	puts "3) Faire une nouvelle partie"
  	puts "4) Quitter"
  	user_selection = gets.to_i
  	if user_selection == 1
  		create_player
  		return 0
  	elsif user_selection == 2
  		menu_selection_players
  		return 0
  	elsif user_selection == 3
  		start_game
  		return 0
  	else
  		return 1
  	end
  end
  def menu_selection_players
  	if @playerNb == 0
  		puts "Aucun joueur n'existe"
  	else
  		print_all_players
  		choose_player
  	end
  end

  def choose_player
  	puts "Modifier le joueur 1 ou 2 ?"
  	user_selection = gets.to_i
  	puts "Quel joueur sélèctionner pour le joueur #{user_selection} ?"
  	user_selection2 = gets.to_i
  	if user_selection == 1
  		@player1 = @players[user_selection2]
  	else
  		@player2 = @players[user_selection2]  		
  	end
  end
  	
  def create_player
  	@players.insert(@playerNb, Player.new(@playerNb))
		# @players.merge!(Player.new(@playerNb): playerNb)
		# @players[@playerNb, Player.new(@playerNb)]
		@playerNb += 1
  end
	def play
		loop do 
			break if menu == 1
		end
	end
	def start_game
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
	def print_all_players
		for i in 1..@playerNb
			@players[i-1].print_player
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
		return gets.to_i
	end
end

game = Game.new
game.play
