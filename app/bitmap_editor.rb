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

    if valid_input?(input)
      *sequence = @sequenceOfCommand.map{ |s| ( s == '0' || s.to_i != 0 ) ? s.to_i : s} # Rewrite it

      case @command
      when 'I'
        @matrix = Matrix.new(*sequence)
      when '?'
        display_help
      when 'X'
        exit_console
      when 'C','L','V','H','S'
        image_processing(*sequence)
      else
        puts "Don't recongnise input"
      end
    else
      puts @error
    end
  end

  def image_processing(*sequence)
    if image_exists?
      case @command
      when 'C'
        @matrix.clear_image 
      when 'L'
        success = @matrix.colour_pixel(*sequence)
      when 'V'
        success = @matrix.add_colour_vertical(*sequence) 
      when 'H'
        success = @matrix.add_colour_horizontal(*sequence) 
      when 'S'
        success = @matrix.show_matrix
      end
    else
      puts @error
    end

    unless success
      puts @matrix.image_size_error
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
    (@command == "I" && (@sequenceOfCommand.count != 2)) || # I 5 6
    (@command == "L" && (@sequenceOfCommand.count != 3)) || # L 2 3 A
    (@command == "V" && (@sequenceOfCommand.count != 4)) || # V 2 3 6 W
    (@command == "H" && (@sequenceOfCommand.count != 4))    # H 3 5 2 Z
  end

  def invalid_numbers?
    @sequenceOfCommand.any?{ |s| s == '0' || s.to_i > 250 || s.to_i < 0}
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
