class BitmapEditor

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

    case @command
    when 'I'
      @matrix = Matrix.new(*sequence)
    when 'L'
      @matrix.colour_pixel(*sequence)
    when 'S'
      @matrix.show_matrix
    when '?'
      show_help
    when 'X'
      exit_console
    else
      puts "Don't recongnise input"
    end

  end

  private

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
