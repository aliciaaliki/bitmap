require_relative '../app/matrix'

describe 'Matrix' do

  before do
    @columns = 5
    @rows = 6
    @image = Matrix.new(@columns, @rows)
  end

  # Create a new M x N image
  it "has 'M (columns)' x 'N (rows)' pixels" do
    expect(@image.matrix_x).to eql(5)
    expect(@image.matrix_y).to eql(6)
  end

  # with all pixels coloured white (O)
  it "has initial colour of O" do
    @image.matrix.each do |array|
      array.each do |r|
        expect(r).to eq('O')
      end
    end
  end

  # L X Y C - Colours the pixel (X,Y) with colour C
  it "Colours the pixel (X,Y) with colour C" do
    expected_image = [['F', 'G', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'A', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'W']]
    @image.colour_pixel(5,6,'W')
    @image.colour_pixel(1,1,'F')
    @image.colour_pixel(2,1,'G')
    @image.colour_pixel(2,3,'A')
    expect(@image.matrix).to eq expected_image
  end

  it "stays unchanged if pixel is out of range" do
    initial_image = [['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O']]
    @image.colour_pixel(6,6,'W')
    expect(@image.matrix).to eq initial_image
  end

  # V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
  it "draws a vertical segment of colour 'C' in column X between rows Y1 and Y2 (inclusive)" do
    expected_image = [['O', 'O', 'O', 'O', 'F'], ['O', 'O', 'O', 'O', 'F'], ['O', 'W', 'O', 'O', 'F'], ['O', 'W', 'O', 'O', 'F'], ['O', 'W', 'O', 'O', 'F'], ['O', 'W', 'O', 'O', 'F']]
    @image.add_colour_vertical(2,3,6,"W")
    @image.add_colour_vertical(5,1,6,"F")
    expect(@image.matrix).to eq expected_image
  end

  it "stays unchanged if vertical segment is out of range" do
    initial_image = [['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O']]
    @image.add_colour_vertical(2,4,7,"R")
    expect(@image.matrix).to eq initial_image
  end

  # H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
  it "draws a horizontal segment of colour 'A' in row Y between columns X1 and X2 (inclusive)" do
    expected_image = [['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['A', 'A', 'A', 'A', 'A'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'B', 'B']]
    @image.add_colour_horizontal(1,5,3,'A')
    @image.add_colour_horizontal(4,5,6,'B')
    expect(@image.matrix).to eq expected_image
  end

  it "stays unchanged if horizontal segment is out of range" do
    initial_image = [['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O']]
    @image.add_colour_horizontal(2,8,7,"R")
    expect(@image.matrix).to eq initial_image
  end

end
