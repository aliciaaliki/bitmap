class Matrix
  attr_reader :matrix, :matrix_x, :matrix_y

  def initialize(columns, rows)
    @matrix_x, @matrix_y = columns, rows
    clear_matrix
  end

  def clear_matrix
    @matrix = (1..@matrix_y).map{ (1..@matrix_x).map{'O'} }
  end

  def show_matrix
    @matrix.each do |row|
      row.each do |cell|
        print cell
      end
      puts 
    end
  end

end
