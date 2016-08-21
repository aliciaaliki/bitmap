class Validation

  MIN = 1
  MAX = 250

  def self.invalid_numbers?(x, y)
    [x, y].any?{ |a| a.to_i > MAX || a.to_i < MIN}
  end

  def self.isCapitalChar?(x)
    !x.match(/[^A-Z]/) unless x.to_i == x
  end

  def self.valid_I_sequence?(x, y)
    isNumber?([x, y])
  end

  def self.valid_L_sequence?(x, y, c)
    isNumber?([x,y]) && isCapitalChar?(c)
  end

  def self.valid_V_H_sequence?(x, r1, r2, c)
    isNumber?([x, r1, r2]) && isCapitalChar?(c)
  end

  def self.isNumber?(array)
    array.all?{ |a| a.to_i == a }
  end

  def self.pixel_within_range?(image, x, y)
    (x.to_i <= image.matrix_x) && (y.to_i <= image.matrix_y)
  end

  def self.vertical_within_range?(image, column, from_row, to_row)
    (column.to_i <= image.matrix_x) && (from_row.to_i < image.matrix_y) && (to_row.to_i <= image.matrix_y)
  end

  def self.horizontal_within_range?(image, from_column, to_column, row)
    (from_column.to_i < image.matrix_x) && (to_column.to_i <= image.matrix_x) && (row.to_i <= image.matrix_y)
  end

end