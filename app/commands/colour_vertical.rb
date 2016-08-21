module Commands
  class ColourVertical

    def self.colour_vertical(image, column, from_row, to_row, colour)
    	raise Error.image_size_error(image) unless Validation.vertical_within_range?(image, column, from_row, to_row)
    	raise Error.not_valid_V_command unless Validation.valid_V_H_sequence?(column, from_row, to_row, colour)

      image.add_colour_vertical(column, from_row, to_row, colour)
    end

  end
end