class Game

    @@row_slots = [[0, 0, 0],[1, 1, 1],[2, 2, 2]]


    def initialize(player_1, player_2)
        @player_1 = player_1
        @player_2 = player_2
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
end

class Computer
end
