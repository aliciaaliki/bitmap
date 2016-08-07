require_relative '../app/bitmap_editor'

describe 'Bitmap_Editor' do

  before do
    @bitmap = BitmapEditor.new
  end

  it "validates input successfully" do
    input = "I 5 6"
    @bitmap.command_manager(input)
    expect(@bitmap.error).to be nil
  end

  it "validates input with error for size" do
    input = "I 400 400"
    @bitmap.command_manager(input)
    expect(@bitmap.error).to eq("Please enter a number between 1-250")
  end

  it "validates empty input with error" do
    input = ""
    @bitmap.command_manager(input)
    expect(@bitmap.error).to eq("Empty input! Please check help for more information")
  end

  it "validates invalid sequence with error" do
    input = "I"
    @bitmap.command_manager(input)
    expect(@bitmap.error).to eq("Wrong sequence in input! Please check help for more information")
  end

  it "validates invalid sequence with error" do
    input = "I 40 40 40"
    @bitmap.command_manager(input)
    expect(@bitmap.error).to eq("Wrong sequence in input! Please check help for more information")
  end


end