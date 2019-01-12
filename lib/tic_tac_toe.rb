class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(move)
    index = move.to_i - 1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    else @board[index] == "X" || @board[index] == "O"
      true
    end
  end

  def valid_move?(position)
  index = position.to_i - 1
    if !position_taken?(position) && position.between?(0,8)
     true
    else
     false
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    token = current_player
     if valid_move?(index)
      puts "valid move"
      move(index, token = "X")
      display_board
     else
      puts "try again"
      turn
     end
  end

  def won?
   WIN_COMBINATIONS.detect do |win_combination|
    location1 = win_combination[0]
    location2 = win_combination[1]
    location3 = win_combination[2]
    @board[location1] == @board[location2] && @board[location2] == @board[location3] && @board[location1] != " "
   end
  end

  def full?
    @board.none? {|index| index == " "}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    win_combination = won?
    if win_combination
      token = win_combination[0]
      @board[token]
    end
  end

  def play
   until over? 
    turn
   end
    if won?
     puts "Congratulations #{winner}!"
    else draw?
     puts "Cat's Game!"
    end
  end

end
