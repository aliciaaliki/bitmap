module Commands
  class CreateImage

    def self.perform(columns, rows)
    	raise Error.not_valid_create_command unless Validation.valid_image_sequence?(columns, rows)
      raise Error.invalid_numbers_error if Validation.invalid_numbers?(columns, rows)

      @columns = columns
      @rows = rows
      Image.new(@columns, @rows)
    end

  end
end