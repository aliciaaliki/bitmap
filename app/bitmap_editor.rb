Dir["./app/commands/*.rb"].each {|file| require file }
require './app/error'
require './app/validation'

class BitmapEditor

  RECOGNISED_INPUT = %w(I L V H F S C ? X)

  def run
    @running = true
    STDOUT.puts 'type ? for help'
    while @running
      print '> '
      input = gets.chomp
      command_manager(input)
    end
  end
  
  def command_manager(input)
    sequence = input.split(' ')
    command = sequence.shift
    sequenceOfCommand = sequence.map{ |s| ( s == '0' || s.to_i != 0 ) ? s.to_i : s}

    if RECOGNISED_INPUT.include?(command)
      case command
      when '?'
        Commands::ShowHelp.perform
      when 'X'
        exit_console
      else
        begin
          image_process(command, sequenceOfCommand)
        rescue Error, ArgumentError => e
          STDOUT.puts("#{e.message.sub(/\S/, &:upcase)}#{"\n"}Press ? to show help.")
        end
      end
    else
      STDOUT.puts("Not recognised input. Press ? to show help.")
    end
  end

  #########
  private #
  #########

  def image_process(command, sequenceOfCommand)
    @image = Commands::CreateImage.perform(*sequenceOfCommand) if command == 'I'
    raise Error.no_image unless @image

    case command         
    when 'L'
      @image = Commands::ColourPixel.perform(@image, *sequenceOfCommand)
    when 'V'
      @image = Commands::ColourVertical.perform(@image, *sequenceOfCommand)
    when 'H'
      @image = Commands::ColourHorizontal.perform(@image, *sequenceOfCommand)
    when 'F'
      @image = Commands::FillArea.perform(@image, *sequenceOfCommand)
    when 'S'
      Commands::ShowImage.perform(@image)
    when 'C'
      @image = Commands::ClearImage.perform(@image)
    end
  end

  def exit_console
    STDOUT.puts("Goodbye!")
    @running = false
  end

end
