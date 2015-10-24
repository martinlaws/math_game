class Question
  @@question_count = 1

  def initialize
    if @@question_count.odd?
      @player_turn = $player1
    else
      @player_turn = $player2
    end

    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @operator = ""

    @operator = ['+', '-', '*'].sample

    if ($player1.lives > 0) && ($player2.lives > 0)
      @@question_count += 1
      prompt_for_answer
    else
      puts 
      puts "BUMMER! You're all out of lives."
      puts 
      end_game
    end
  end

  def prompt_for_answer
    puts
    puts "Ok #{@player_turn.name}, answer this: What is #{@num1} #{@operator} #{@num2}?"
    @player_answer = gets.chomp.to_i
    verify_answer(@num1, @num2, @operator)
  end

  def verify_answer(num1, num2, operator)
    real_answer = num1.send(operator, num2)
    if @player_answer == real_answer
      puts "Correct!"
      @player_turn.score += 1
      puts "CURRENT SCORE:"
      puts "#{$player1.name}: #{$player1.score}"
      puts "#{$player2.name}: #{$player2.score}"
    else
      puts "WRONG!"
      @player_turn.lives -= 1
      puts "#{@player_turn.name} has #{@player_turn.lives} lives remaining."
    end  
  end

  def end_game
    puts "Thanks for playing!"
    puts "FINAL SCORE:"
    puts "#{$player1.name}: #{$player1.score}"
    puts "#{$player2.name}: #{$player2.score}"
    $lives = false
  end
end