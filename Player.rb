class Player
	@playerNb
	@name
	def initialize(playerNb)
		@playerNb = playerNb
	  	puts "Quel est le nom du joueur #{playerNb}"
  		@name = gets.gsub("\n","")
	end
	def getName
		return @name
	end
end
		