require_relative '../app/bitmap_editor'

describe 'Bitmap_Editor' do

  before do
    @bitmap = BitmapEditor.new
  end

  it "validates empty input with error" do
    input = ""
    @bitmap.command_manager(input)
    expect(@bitmap.error).to eq("Empty input! Please check help for more information")
  end

  it "returns error message for unexpected input" do
    input = "AA"
    @bitmap.command_manager(input)
    expect(@bitmap.error).to eq("Don't recognise input. Please check help for more information")
  end

  it "validates input successfully" do
    input = "I 5 6"
    @bitmap.command_manager(input)
    expect(@bitmap.error).to be nil
  end

  it "validates invalid sequence with error" do
    input = "I"
    @bitmap.command_manager(input)
    expect(@bitmap.error).to eq("Wrong sequence in input! Please check help for more information")
  end

  it "validates invalid sequence with error" do
    input = "I 10 10 EEE"
    @bitmap.command_manager(input)
    expect(@bitmap.error).to eq("Wrong sequence in input! Please check help for more information")
  end

  it "validates input with error for size" do
    input = "I 400 400"
    @bitmap.command_manager(input)
    expect(@bitmap.error).to eq("Please enter a number between 1-250")
  end

  it "validates invalid sequence with error" do
    input = "L 40 40 40"
    @bitmap.command_manager(input)
    expect(@bitmap.error).to eq("Wrong sequence in input! Please check help for more information")
  end

  it "validates input successfully" do
    input = "I 5 6"
    @bitmap.command_manager(input)
    input = "L 5 6 X"
    @bitmap.command_manager(input)
    expect(@bitmap.error).to be nil
  end

  it "returns error when there is no image" do
    input = "L 5 6 X"
    @bitmap.command_manager(input)
    expect(@bitmap.error).to eq("Draw an image first, ex 'I 5 6'")
  end

  it "validates input successfully" do
    input = "I 5 6"
    @bitmap.command_manager(input)
    input = "V 2 3 6 X"
    @bitmap.command_manager(input)
    expect(@bitmap.error).to be nil
  end

  it "validates invalid sequence with error" do
    input = "V 40 40 40"
    @bitmap.command_manager(input)
    expect(@bitmap.error).to eq("Wrong sequence in input! Please check help for more information")
  end

  it "validates input successfully" do
    input = "I 5 6"
    @bitmap.command_manager(input)
    input = "H 2 6 1 X"
    @bitmap.command_manager(input)
    expect(@bitmap.error).to be nil
  end

  it "validates invalid sequence with error" do
    input = "H 40"
    @bitmap.command_manager(input)
    expect(@bitmap.error).to eq("Wrong sequence in input! Please check help for more information")
  end

  it "validates input successfully" do
    input = "X"
    @bitmap.command_manager(input)
    expect(@bitmap.error).to be nil
  end

  it "returns error message for unexpected input" do
    input = "X 10"
    @bitmap.command_manager(input)
    expect(@bitmap.error).to eq("Wrong sequence in input! Please check help for more information")
  end

  it "returns error when there is no image" do
    input = "S"
    @bitmap.command_manager(input)
    expect(@bitmap.error).to eq("Draw an image first, ex 'I 5 6'")
  end

  it "validates input successfully" do
    input = "I 5 6"
    @bitmap.command_manager(input)
    input = "S"
    @bitmap.command_manager(input)
    expect(@bitmap.error).to be nil
  end

  it "returns error when there is no image" do
    input = "C"
    @bitmap.command_manager(input)
    expect(@bitmap.error).to eq("Draw an image first, ex 'I 5 6'")
  end

  it "validates input successfully" do
    input = "I 5 6"
    @bitmap.command_manager(input)
    input = "H 2 6 1 X"
    @bitmap.command_manager(input)
    input = "C"
    @bitmap.command_manager(input)
    expect(@bitmap.error).to be nil
  end



end