
class GameBoard
	@board = []
    def initialize
      @board = Array.new(9)
      for i in 0..9
      	@board[i] = 0
      end
    end
    def pretty_print
    	for i in 0..2
    		puts " #{@board[i*3]} | #{@board[i*3+1]} | #{@board[i*3+2]}            #{i*3} | #{i*3+1} | #{i*3+2} "
    	end
    end
    def finish
    	if (@board[0] == @board[1] && @board[0] == @board[2] && @board[0] != 0)
    		return @board[0]
    	elsif (@board[3] == @board[4] && @board[3] == @board[5] && @board[3] != 0)
    		return @board[3]
    	elsif (@board[6] == @board[7] && @board[6] == @board[8] && @board[6] != 0)
    		return @board[6]
    	elsif (@board[0] == @board[3] && @board[0] == @board[6] && @board[0] != 0)
    		return @board[0]
    	elsif (@board[1] == @board[4] && @board[1] == @board[7] && @board[1] != 0)
    		return @board[1]
    	elsif (@board[2] == @board[5] && @board[2] == @board[8] && @board[2] != 0)
    		return @board[2]
    	elsif (@board[0] == @board[4] && @board[0] == @board[8] && @board[0] != 0)
    		return @board[0]
    	elsif (@board[2] == @board[4] && @board[2] == @board[6] && @board[2] != 0)
    		return @board[2]
    	else
    		return 0
    	end
    end
    def place(caseNb, player)
    	if @board[caseNb] != 0
    		puts "la case #{caseNb} est occupé"
    		return -1
    	else
    		@board[caseNb] = player
    		puts "Puts #{player} in case nb #{caseNb}"
    		pretty_print
    		return 0
    	end
    end
end
