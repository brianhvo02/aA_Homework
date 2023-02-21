class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = self.place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups = Array.new(14) { [] }
      .fill(0 ... 6) { Array.new(4) { [] }.fill(:stone) }
      .fill(7 ... 13) { Array.new(4) { [] }.fill(:stone) }
  end

  def valid_move?(start_pos)
    raise ArgumentError.new("Invalid starting cup") if start_pos < 0 || start_pos > 13
    raise ArgumentError.new("Starting cup is empty") if cups[start_pos].count == 0
  end

  def make_move(start_pos, current_player_name)
    valid_move?(start_pos)
    stones = cups[start_pos]
    cups[start_pos] = []
    until stones.empty?
      start_pos = (start_pos + 1) % 14
      next if (current_player_name == @name2 && start_pos == 6) || (current_player_name == @name1 && start_pos == 13)
      cups[start_pos].push(stones.shift)
    end
    self.render
    next_turn(start_pos, current_player_name)
  end

  def next_turn(ending_cup_idx, current_player_name)
    # helper method to determine what #make_move returns
    return :prompt if (current_player_name == @name1 && ending_cup_idx == 6) || (current_player_name == @name2 && ending_cup_idx == 13)
    return :switch if cups[ending_cup_idx].count == 1

    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0 ... 6].all?(&:empty?) || cups[7 ... 13].all?(&:empty?)
  end

  def winner
    return :draw if cups[6] == cups[13]
    cups[6].count > cups[13].count ? @name1 : @name2
  end
end