module Commands
  class ColourPixel

    def self.colour(image, x, y, colour)
    	raise Error.image_size_error(image) unless Validation.pixel_within_range?(image, x, y)
    	raise Error.not_valid_L_command unless Validation.valid_L_sequence?(x, y, colour)

      image.colour_pixel(x, y, colour) 
    end

  end
end