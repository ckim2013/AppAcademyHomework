class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1, @name2 = name1, name2
    @cups = place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    Array.new(14) { [] }.map.with_index do |cup, i|
      i == 6 || i == 13 ? [] : [:stone, :stone, :stone, :stone]
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' unless start_pos.between?(0, 12)
  end

  def make_move(start_pos, current_player_name)
    stones_in_hand = @cups[start_pos]
    @cups[start_pos] = []
    side = (@name1 == current_player_name ? 1 : 2)
    enemy_pos = (side == 1 ? 13 : 6)
    current_pos = start_pos
    until stones_in_hand.empty?
      current_pos = (current_pos + 1) % 14
      next if current_pos == enemy_pos
      @cups[current_pos] << stones_in_hand.shift
    end
    render
    next_turn(current_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    return :prompt if [13, 6].include?(ending_cup_idx)
    return :switch if @cups[ending_cup_idx].count(:stone) == 1
    return ending_cup_idx if @cups[ending_cup_idx].include?(:stone)
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].all?(&:empty?) || @cups[7..12].all?(&:empty?)
    false
  end

  def winner
    return :draw if @cups[6].length == 6 && @cups[6] == @cups[13]
    @cups[6].length > @cups[13].length ? @name1 : @name2
  end
end
