class BitmapEditor
  attr_reader :error

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

    *sequence = @sequenceOfCommand.map{ |s| ( s == '0' || s.to_i != 0 ) ? s.to_i : s}
    if valid_input?(input)
      case @command
      when 'I'
        @matrix = Matrix.new(*sequence)
      when 'L'
        @matrix.colour_pixel(*sequence)
      when 'V'
        @matrix.add_colour_vertical(*sequence) 
      when 'H'
        @matrix.add_colour_horizontal(*sequence)
      when 'S'
        @matrix.show_matrix
      when '?'
        show_help
      when 'X'
        exit_console
      else
        puts "Don't recongnise input"
      end
    else
      puts @error
    end

  end

  ###########
    private #
  ###########

  def valid_input?(input)
    if input.empty?
      @error = "Empty input! Please check help for more information"
      false
    elsif invalid_sequenceOfCommands?
      @error = "Wrong sequence in input! Please check help for more information"
      false
    elsif invalid_numbers?
      @error = "Please enter a number between 1-250"
      false
    else
      true
    end
  end

  def invalid_sequenceOfCommands?
    (CHARS_WITHOUT_SEQUENCE.include? @command) && (@sequenceOfCommand.count != 0) || 
    (@command == "I" && (@sequenceOfCommand.count != 2)) ||
    (@command == "L" && (@sequenceOfCommand.count != 3)) ||
    (@command == "V" && (@sequenceOfCommand.count != 4)) ||
    (@command == "H" && (@sequenceOfCommand.count != 4))
  end

  def invalid_numbers?
    @sequenceOfCommand.any?{ |s| s == '0' || s.to_i > 250 || s.to_i < 0}
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
