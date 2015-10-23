require_relative './question.rb'
require_relative './player.rb'
require 'pry'

$lives = true
puts
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts
puts "Welcome!"
puts
puts "When you're ready to start, press enter."
input = gets

if input != ""
  puts "Ok player 1, what's your name?"
  $player1 = Player.new(gets.chomp!)
  puts "Player 2, what's your name?"
  $player2 = Player.new(gets.chomp!)
  
  loop do
    if $lives
      Question.new
    else
      puts
      puts "Press enter to continue or quit to leave"
        if gets.chomp! == "quit"
          exit
        else
          $lives = true
          $player1.lives = 3
          $player2.lives = 3
        end #ends inner if
    end #ends outer if
  end #ends game loop
end #ends player name input if