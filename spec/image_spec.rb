require_relative '../app/image'

describe 'Image' do

  let(:image){ Image.new(5,6) }
  let(:image_matrix){ image.instance_variable_get(:@matrix) }

  # Create a new M x N image
  it "has 'M (columns)' x 'N (rows)' pixels" do
    expect(image.matrix_x).to eql(5)
    expect(image.matrix_y).to eql(6)
  end

  # with all pixels coloured white (O)
  it "has initial colour of O" do
    image_matrix.each do |array|
      array.each do |r|
        expect(r).to eq('O')
      end
    end
  end

  # L X Y C - Colours the pixel (X,Y) with colour C
  it "Colours the pixel (X,Y) with colour" do
    expected_image_matrix = [['F', 'G', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'A', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'W']]

    image.colour_pixel(5,6,'W')
    image.colour_pixel(1,1,'F')
    image.colour_pixel(2,1,'G')
    image.colour_pixel(2,3,'A')

    expect(image_matrix).to eq expected_image_matrix
  end

  # V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
  it "draws a vertical segment of colour 'C' in column X between rows Y1 and Y2 (inclusive)" do
    expected_image_matrix = [['O', 'O', 'O', 'O', 'F'], ['O', 'O', 'O', 'O', 'F'], ['O', 'W', 'O', 'O', 'F'], ['O', 'W', 'O', 'O', 'F'], ['O', 'W', 'O', 'O', 'F'], ['O', 'W', 'O', 'O', 'F']]
    
    image.add_colour_vertical(2,3,6,"W")
    image.add_colour_vertical(5,1,6,"F")

    expect(image_matrix).to eq expected_image_matrix
  end

  # H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
  it "draws a horizontal segment of colour 'A' in row Y between columns X1 and X2 (inclusive)" do
    expected_image_matrix = [['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['A', 'A', 'A', 'A', 'A'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'B', 'B']]

    image.add_colour_horizontal(1,5,3,'A')
    image.add_colour_horizontal(4,5,6,'B')

    expect(image_matrix).to eq expected_image_matrix
  end

  # C - Clears the table, setting all pixels to white (O)
  it "clears all the image" do
    expected_image_matrix = [['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O']]
    image.colour_pixel(1,1,'X')
    image.colour_pixel(5,6,'B')
    image.add_colour_vertical(3,4,5,"W")
    image.add_colour_horizontal(4,5,6,'B')
    image.colour_pixel(2,3,'A')

    image.clear_image
    expect(image_matrix).to eq expected_image_matrix
  end

end
