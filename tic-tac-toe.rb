class Game

    attr_reader :board

    def initialize(player_1_class, player_2_class)
        @player_1_class = player_1_class
        @player_2_class = player_2_class
        @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    def play()
        player_1 = @player_1_class.new(self)
        player_2 = @player_2_class.new(self)
        player_1.select_marker()
    end

    def create_board()
        col_separator, row_separator = "|", "---+---+---"

        @board.each do |slot|
            print " #{slot} #{(slot % 3)==0? "\n": col_separator}"
            print "#{row_separator+"\n" if((slot % 3)==0 && slot < 7)}"        
        end
    end
    
    def add_marker(slot)
        @board[slot - 1] = "X"
        create_board()
    end
end

class Player
    attr_reader :markers
    def initialize(game)
        @game = game
        @markers = []
    end


    def select_marker()
        temp_marker = 5
        if (@game.board.include?(temp_marker))
            @markers.push(temp_marker)
            @game.add_marker(temp_marker)
        end
    end
end

class HumanPlayer < Player
end

class ComputerPlayer < Player
end

game1 = Game.new(HumanPlayer, HumanPlayer)

game1.play()