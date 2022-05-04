class Game

    @@row_slots = [[1, 2, 3],[4, 5, 6],[7, 8, 9]]


    def initialize(player_1_class, player_2_class)
        @player_1_class = player_1_class
        @player_2_class = player_2_class
    end
    def play()
        player_1 = @player_1_class.new(self)
        player_2 = @player_2_class.new(self)
        create_board()
    end
    def create_board()
        col_separator, row_separator = "|", "---+---+---"

        @@row_slots.each_with_index do |row, index|
            row.each_with_index do |slot, index|
                print " #{slot} #{col_separator if(index != 2)}"
            end
            puts "\n"
            puts row_separator if(index != 2)
        end
    end

end

class Player
    def initialize(game)
        @game = game
    end
end

class HumanPlayer < Player
end

class ComputerPlayer
end

game1 = Game.new(HumanPlayer, HumanPlayer)

game1.play()