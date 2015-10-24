require_relative './question.rb'
require_relative './player.rb'

$lives = true
puts
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts
puts "Welcome!"
puts
puts "Ok player 1, what's your name?"
$player1 = Player.new(gets.chomp!)
puts "Player 2, what's your name?"
$player2 = Player.new(gets.chomp!)

loop do
  if $lives
    Question.new
  else
    puts
    puts "Alright #{$player1.name} and #{$player2.name}, type quit to leave or anything else to keep playing."
      if gets.chomp! == "quit"
        exit
      else
        $lives = true
        $player1.lives = 3
        $player2.lives = 3
      end #ends inner if
  end #ends outer if
end #ends game loop