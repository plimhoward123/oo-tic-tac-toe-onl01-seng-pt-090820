
class TicTacToe

  attr_accessor :board, :turn_count

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

  def initialize(board = nil)
     @board = board || Array.new(9, " ")
   end

   def current_player
     turn_count % 2 == 0 ? "X" : "O"
   end

   def turn_count
     @board.count{|token| token == "X" || token == "O"}
   end

   def display_board
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end

   def input_to_index(num)
     tab = num.to_i - 1
     tab
   end

   def move(num,plyr)
     board[num] = plyr
   end

   def position_taken?(index)
     if(board[index] == " ")
       return false
     else
       return true
     end
   end

   def valid_move?(num)
     if (num == 0 || position_taken?(0))
       return true
     elsif (num == (1..8) || position_taken?(num+1))
       return true
     else
       return false
     end
   end

   def turn
     puts "Please input 1-9:"
     val = input_to_index(gets.to_i)
     if (valid_move?(val))
       board[val] = current_player
       puts display_board
     else
       turn
     end
   end

   def won?
     WIN_COMBINATIONS.each do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
  position_1 = board[win_index_1] # value of board at win_index_1
  position_2 = board[win_index_2] # value of board at win_index_2
  position_3 = board[win_index_3] # value of board at win_index_3
  position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
   end
   def full?
     board.all? {|x| x == "X" || x == "O"}
   end
end
