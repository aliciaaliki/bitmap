class Image
  attr_accessor :matrix_x, :matrix_y
  
  def initialize(columns, rows)
    @matrix_x, @matrix_y = columns, rows
    @matrix = (1..@matrix_y).map{ (1..@matrix_x).map{'O'} }
  end

  def clear_image
    @matrix.each do |array|
      array.fill("O")
    end
    self
  end

  def show_image
    @matrix.each do |row|
      row.each do |cell|
        print cell
      end
      STDOUT.puts
    end
  end

  def colour_pixel(x, y, colour)
    @matrix[y - 1][x - 1] = colour
    self
  end

  def add_colour_vertical(column, from_row, to_row, colour)
    for i in from_row..to_row
      row = @matrix[i-1]
      row[column-1] = colour
    end
    self
  end

  def add_colour_horizontal(from_column, to_column, row, colour)
    row_array = @matrix[row-1]
    for i in from_column..to_column
      row_array[i-1] = colour
    end
    self
  end

end
