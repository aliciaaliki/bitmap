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

  def colour_pixel(x, y, colour)
    if pixel_within_range?(x, y)
      @matrix[y - 1][x - 1] = colour
    end
  end

  def pixel_within_range?(x, y)
    (x <= @matrix_x) && (y <= @matrix_y)
  end

end
