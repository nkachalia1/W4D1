require_relative 'searchable.rb'

class KnightPathFinder

    attr_reader @considered_positions

    def initialize(starting_position)
        @root_node = PolyTreeNode.new(starting_position)
        make_tree(@root_node)
        @considered_positions = [starting_position]
    end

    def new_move_positions(pos)
    end

    def make_tree(node)
        current_position = node.value
        current_row, current_col = current_position
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
        new_pos.reject! { |el| @considered_positions.include?(el) }

        return nil if new_pos.empty?

        new_pos.each do |el|
            child_node = PolyTreeNode.new(el)
            make_tree(child_node)
            node.add_child(child_node)

end
