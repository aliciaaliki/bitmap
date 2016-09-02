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
        print cell + " "
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

  def fill_area(x, y, colour)
    target_colour = @matrix[y-1][x-1]
    return if colour == target_colour

    colour_pixel(x, y, colour) 
    
    fill_area(x, y-1, colour) if valid_north?(x, y, target_colour)
    fill_area(x+1, y, colour) if valid_east?(x, y, target_colour)
    fill_area(x, y+1, colour) if valid_south?(x, y, target_colour)
    fill_area(x-1, y, colour) if valid_west?(x, y, target_colour)

    self
  end

  def valid_north?(x, y, target_colour)
    valid_x?(x-1) && valid_y?(y-2) && @matrix[y-2][x-1] == target_colour
  end

  def valid_east?(x, y, target_colour)
    valid_x?(x) && valid_y?(y-1) && @matrix[y-1][x] == target_colour
  end

  def valid_south?(x, y, target_colour)
    valid_x?(x-1) && valid_y?(y) && @matrix[y][x-1] == target_colour
  end

  def valid_west?(x, y, target_colour)
    valid_x?(x-2) && valid_y?(y-1) && @matrix[y-1][x-2] == target_colour
  end

  def valid_x?(number)
    number >= 0 && number < matrix_x
  end

  def valid_y?(number)
    number >= 0 && number < matrix_y
  end

end
