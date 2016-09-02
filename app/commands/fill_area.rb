module Commands
  class FillArea

    def self.perform(image, x, y, colour)
    	raise Error.image_size_error(image) unless Validation.pixel_within_range?(image, x, y)
    	raise Error.not_valid_colour_command unless Validation.valid_colour_sequence?(x, y, colour)

      image.fill_area(x, y, colour) 
    end

  end
end