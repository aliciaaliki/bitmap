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

end
