require_relative 'searchable.rb'

class KnightPathFinder
  

    def self.new_move_positions(pos)
        current_row, current_col = pos
        new_pos = []
        (-2..2).each do |row|
            (-2..2).each do |col|
                if row.abs + col.abs == 3
                    new_row = row + current_row
                    new_col = col + current_col
                    new_pos << [new_row, new_col]
                end
            end
        end

        new_pos.reject! { |el| el.any? { |i| i < 1 || i > 8 } }
  

        return new_pos
    end 
    
    attr_reader :considered_positions

    def initialize(starting_position)
        @root_node = PolyTreeNode.new(starting_position)
        @queue = []
        @queue << @root_node
        @considered_positions = [starting_position]
        self.make_tree
    end
   

    def make_tree
        until @queue.empty? 
            head = @queue.shift
            current_position = head.value
            new_pos = KnightPathFinder.new_move_positions(current_position)
            new_pos.reject! { |el| @considered_positions.include?(el) }

            @considered_positions += new_pos

            new_pos.each do |el|
                child_node = PolyTreeNode.new(el)
                head.add_child(child_node)
                @queue << child_node
            end 
        end 
    end 

end

