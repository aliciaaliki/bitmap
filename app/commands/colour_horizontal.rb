module Commands
  class ColourHorizontal

    def self.perform(image, from_column, to_column, row, colour)
    	raise Error.image_size_error(image) unless Validation.horizontal_within_range?(image, from_column, to_column, row)
    	raise Error.not_valid_horizontal_command unless Validation.valid_vertical_horizontal_sequence?(from_column, to_column, row, colour)
    	
      image.add_colour_horizontal(from_column, to_column, row, colour)
    end

  end
end