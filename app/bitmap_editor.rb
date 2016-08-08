class BitmapEditor
  attr_reader :error

  CHARS_WITH_SEQUENCE = %w(I L V H)
  CHARS_WITHOUT_SEQUENCE = %w(C S ? X)

  def run
    @running = true
    puts 'type ? for help'
    while @running
      print '> '
      input = gets.chomp
      command_manager(input)
    end
  end

  def command_manager(input)
    @sequenceOfCommand = input.split(' ')
    @command = @sequenceOfCommand.shift

    if valid_input?(input)
      *sequence = @sequenceOfCommand.map{ |s| ( s == '0' || s.to_i != 0 ) ? s.to_i : s}

      case @command
      when 'I'
        @matrix = Matrix.new(*sequence)
      when '?'
        show_help
      when 'X'
        exit_console
      when 'C'
        @matrix.clear_matrix if image_exists?
      when 'L'
        @matrix.colour_pixel(*sequence) if image_exists?
      when 'V'
        @matrix.add_colour_vertical(*sequence) if image_exists?
      when 'H'
        @matrix.add_colour_horizontal(*sequence) if image_exists?
      when 'S'
        @matrix.show_matrix if image_exists?
      end
    else
      puts @error
    end
  end

  ###########
    private #
  ###########

  def valid_input?(input)
    case
    when input.empty?
      @error = "Empty input! Please check help for more information"
      false
    when unexpectedInput?
      @error =  "Don't recognise input. Please check help for more information"
      false
    when invalid_numbers?
      @error = "Please enter a number between 1-250"
      false
    when (@command == "I" && !valid_I_sequence?) || 
         (@command == "L" && !valid_L_sequence?) ||
         ((@command == "V" || @command == "H") && !valid_V_H_sequence?) ||
         ((CHARS_WITHOUT_SEQUENCE.include? @command) && !valid_chars_without_sequence?)
            @error =  "Wrong sequence in input! Please check help for more information"
            false
    else
      true
    end
  end

  def unexpectedInput?
    !(CHARS_WITH_SEQUENCE.include? @command) && !(CHARS_WITHOUT_SEQUENCE.include? @command)
  end

  def valid_I_sequence?
    @sequenceOfCommand.count == 2 && isNumber?(@sequenceOfCommand)
  end

  def valid_L_sequence?
    @sequenceOfCommand.count == 3 && isNumber?(@sequenceOfCommand[0..1]) && isCapitalChar?(@sequenceOfCommand.last)
  end

  def valid_V_H_sequence?
    @sequenceOfCommand.count == 4 && isNumber?(@sequenceOfCommand[0..2]) && isCapitalChar?(@sequenceOfCommand.last)
  end

  def valid_chars_without_sequence?
    @sequenceOfCommand.count == 0
  end

  def invalid_numbers?
    @sequenceOfCommand.any?{ |s| s.to_i > 250 || s.to_i < 0}
  end

  def isCapitalChar?(x)
    !x.match(/[^A-Z]/)
  end

  def isNumber?(array)
    array.all?{ |a| a.to_i.to_s == a }
  end

  def image_exists?
    if @matrix 
      true 
    else
      @error = "Draw an image first, ex 'I 5 6'"
      false
    end
  end

  def show_help
    puts "? - Help
          I M N - Create a new M x N image with all pixels coloured white (O).
          C - Clears the table, setting all pixels to white (O).
          L X Y C - Colours the pixel (X,Y) with colour C.
          V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
          H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
          S - Show the contents of the current image
          X - Terminate the session"
  end

  def exit_console
    puts 'goodbye!'
    @running = false
  end

end
