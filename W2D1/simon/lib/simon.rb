class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    puts 'Welcome to the Simon game! Let us start with one color!'
    sleep(2)
    system('clear')
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep(2)
      system('clear')
    end
  end

  def require_sequence
    puts 'Now try to guess the sequence!'
    puts 'Please provide your guess of colors separated by a space!'
    guesses = gets.chomp.split(' ')
    until guesses.all? { |color| COLORS.include?(color)}
      puts 'Invalid response! Try again!'
      guesses = gets.chomp.split(' ')
    end
    @game_over = true unless guesses == @seq
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    system('clear')
    puts 'Great memory you have! Next round!'
    sleep(2)
    system('clear')
  end

  def game_over_message
    puts 'Game over! You need to work on your memory!'
    puts "You couldn't even get to length: #{@sequence_length}"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end
