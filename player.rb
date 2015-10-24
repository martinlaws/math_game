class Player
  @@player_count = 0
  attr_accessor :name, :score, :lives

  def initialize(name = "Player #{Player.num_players + 1}")
    @@player_count += 1
    @name = name
    @score = 0
    @lives = 3
  end

  def self.num_players
    @@player_count
  end
end