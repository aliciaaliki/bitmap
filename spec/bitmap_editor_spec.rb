require_relative '../app/bitmap_editor'

describe 'Bitmap_Editor' do

  before do
    @bitmap = BitmapEditor.new
  end

  it "returns error message for empty input" do
    input = ""
    expect(STDOUT).to receive(:puts).with('Not recognised input. Press ? to show help.')
    @bitmap.command_manager(input)
  end

  it "returns error message for unexpected input" do
    input = "AA BB rty"
    expect(STDOUT).to receive(:puts).with('Not recognised input. Press ? to show help.')
    @bitmap.command_manager(input)
  end

  # # L sequence

  it "returns error when there is no image" do
    input = "L 5 6 X"
    expect(STDOUT).to receive(:puts).with("#{Error.no_image}#{"\n"}Press ? to show help.")
    @bitmap.command_manager(input)
  end

  # V sequence

  it "returns error when there is no image" do
    input = "V 2 5 6 X"
    expect(STDOUT).to receive(:puts).with("#{Error.no_image}#{"\n"}Press ? to show help.")
    @bitmap.command_manager(input)
  end

  # H sequence

  it "returns error when there is no image" do
    input = "H 2 5 6 X"
    expect(STDOUT).to receive(:puts).with("#{Error.no_image}#{"\n"}Press ? to show help.")
    @bitmap.command_manager(input)
  end

  # S sequence

  it "returns error when there is no image" do
    input = "S"
    expect(STDOUT).to receive(:puts).with("#{Error.no_image}#{"\n"}Press ? to show help.")
    @bitmap.command_manager(input)
  end

  # C sequence

  it "returns error when there is no image" do
    input = "C"
    expect(STDOUT).to receive(:puts).with("#{Error.no_image}#{"\n"}Press ? to show help.")
    @bitmap.command_manager(input)
  end

  # X sequence

  it "validates X input successfully" do
    input = "X"
    expect(STDOUT).to receive(:puts).with("Goodbye!")
    @bitmap.command_manager(input)
  end

  # ? sequence

  it "validates ? input successfully" do
    input = "?"
    expect(STDOUT).to receive(:puts).with("? - Help 
                    I M N - Create a new M x N image with all pixels coloured white (O).
                    C - Clears the table, setting all pixels to white (O).
                    L X Y C - Colours the pixel (X,Y) with colour C.
                    V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
                    H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
                    S - Show the contents of the current image
                    X - Terminate the session")
    @bitmap.command_manager(input)
  end

end