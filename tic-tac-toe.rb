class Game

    attr_reader :board
    @@current_player = nil
    def initialize(player_1_class, player_2_class)
        @player_1_class = player_1_class
        @player_2_class = player_2_class
        @player_1 = @player_1_class.new(self, 1)
        @player_2 = @player_2_class.new(self, 2)
        @board = {1 =>1, 2 => 2, 3 => 3, 4 => 4, 5 =>  5, 6 => 6, 7 => 7, 8 => 8, 9 => 9}
        @@current_player = @player_1

    end

    def play()
        loop do
            create_board()
            puts "Player #{@@current_player.id} select from the available slots"
            selected_marker = gets.chomp.to_i
            @@current_player.select_marker(selected_marker)
            switch_player()
        end
    end

    def create_board()
        col_separator, row_separator = "|", "---+---+---"
        @board.each do |key, slot|
            print " #{slot} #{(key % 3)==0? "\n": col_separator}"
            print "#{row_separator+"\n" if((key % 3)==0 && key < 7)}"        
        end
    end
    
    def place_player_marker(markers)
        markers.each do |slot|
            @board[slot] = @@current_player == @player_1? "X" : "O"
        end
        
    end

    def switch_player()
        @@current_player = @@current_player == @player_1? @player_2 : @player_1
    end
end

class Player
    attr_reader :markers
    attr_reader :id
    def initialize(game, id)
        @game = game
        @markers = []
        @id = id
    end


    def select_marker(selected_marker)
        if (@game.board[selected_marker] == selected_marker)
            @markers.push(selected_marker)
            @game.place_player_marker(markers)
        end
    end
end

class HumanPlayer < Player
end

class ComputerPlayer < Player
end

game1 = Game.new(HumanPlayer, HumanPlayer)

game1.play()