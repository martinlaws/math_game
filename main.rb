require_relative './question.rb'
require_relative './player.rb'

def name_check1(name_input)
  if name_input == ""
    begin
      raise 'InvalidNameEntry'
    rescue RuntimeError
      puts "Sorry, it doesn't look like you've entered your name! Please try again:"
      name_check1(gets.chomp!)
    end
  else
    $player1 = Player.new(name_input)
    puts "Thanks, #{$player1.name}!"
  end
end

def name_check2(name_input)
  if name_input == ""
    begin
      raise 'InvalidNameEntry'
    rescue RuntimeError
      puts "Sorry, it doesn't look like you've entered your name! Please try again:"
      name_check2(gets.chomp!)
    end
  else
    $player2 = Player.new(name_input)
    puts "Thanks, #{$player2.name}!"
  end
end

$lives = true
puts
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts
puts "Welcome!"
puts
puts "Ok player 1, what's your name?"
name_check1(name_input = gets.chomp)
puts "Ok player 2, what's your name?"
name_check2(name_input = gets.chomp)

loop do
  if $lives
    Question.new
  else
    puts
    puts "Alright #{$player1.name} and #{$player2.name}, type quit to leave or anything else to keep playing."
      if gets.chomp! == "quit"
        break
      else
        $lives = true
        $player1.lives = 3
        $player2.lives = 3
      end #ends inner if
  end #ends outer if
end #ends this game loop