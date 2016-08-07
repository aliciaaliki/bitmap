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

  def add_colour_vertical(column, from_row, to_row, colour)
    if vertical_within_range?(column, from_row, to_row)
      for i in from_row..to_row
        row = @matrix[i-1]
        row[column-1] = colour
      end
    else
      image_size_error
    end
  end

  def vertical_within_range?(column, from_row, to_row)
    (column <= @matrix_x) && (from_row < @matrix_y) && (to_row <= @matrix_y)
  end

  def add_colour_horizontal(from_column, to_column, row, colour)
    if horizontal_within_range?(from_column, to_column, row)
      row_array = @matrix[row-1]

      for i in from_column..to_column
        row_array[i-1] = colour
      end
    else
      image_size_error
    end
  end

  def horizontal_within_range?(from_column, to_column, row)
    (from_column < @matrix_x) && (to_column <= @matrix_x) && (row <= @matrix_y)
  end

end
