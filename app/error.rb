class Error < StandardError

  def self.no_image
    new("Draw an image first.")
  end

  def self.invalid_numbers_error
    new("Numbers should be between 1 to 250.")
  end

  def self.image_size_error(image)
    new("Image's size is #{image.matrix_x}x#{image.matrix_y}. Try again!")
  end

  def self.not_valid_I_command
    new("It's not a valid I command.")
  end

  def self.not_valid_L_command
    new("It's not a valid L command.")
  end

  def self.not_valid_V_command
    new("It's not a valid V command.")
  end

  def self.not_valid_H_command
    new("It's not a valid H command.")
  end

end