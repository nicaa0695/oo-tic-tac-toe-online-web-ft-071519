class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]
  
  def display_board
    row = '-----------'
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts row 
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts row
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1 
  end
  
  def move(index, character)
    @board[index] = character
  end
  
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end
  
  def turn 
    puts 'Please enter 1-9:'
    input = gets.strip
    index = input_to_index(input)
    
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    count = 0 
    @board.each do |token|
      if token == "X" || token == "O"
        count += 1 
      end
    end
    return count
  end
  
  def won?
    WIN_COMBINATIONS.find do |win_combination|
      if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
        win_combination
        true 
      elsif 
end