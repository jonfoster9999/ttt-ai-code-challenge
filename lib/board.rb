

class Board
	attr_accessor :cells, :answer_token

	def initialize
		self.reset!
		@answer_token = []
	end

	def reset!
		@cells = Array.new(9, " ")
	end

	def display
		puts ""
		puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
		puts "-----------"
		puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
		puts "-----------"
		puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
		puts ""
	end

	def position(position)
		cells[position.to_i - 1]
	end

	def full?
		cells.all? {|cell| cell != " "}
	end

	def turn_count
		(self.cells.select {|cell| cell == "O" || cell == "X"}).count
	end

	def taken?(position)
		self.position(position) != " "
	end

	def valid_move?(position)
		!self.taken?(position) && position.to_i.between?(1, 9)
	end

	def update(position, player)
		@cells[position.to_i - 1] = player.token
	end

	def random_non_taken_index
		self.cells.each_index.select {|i| self.cells[i] == " " }.sample
	end

end
