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

end
