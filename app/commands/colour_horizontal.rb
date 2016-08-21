module Commands
  class ColourHorizontal

    def self.colour_horizontal(image, from_column, to_column, row, colour)
    	raise Error.image_size_error(image) unless Validation.horizontal_within_range?(image, from_column, to_column, row)
    	raise Error.not_valid_H_command unless Validation.valid_V_H_sequence?(from_column, to_column, row, colour)
    	
      image.add_colour_horizontal(from_column, to_column, row, colour)
    end

  end
end