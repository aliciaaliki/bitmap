require_relative '../app/validation'
require_relative '../app/image'

describe 'Validation' do

  before do
    @image = Image.new(5, 6)
  end

  # invalid_numbers?
  it "returns true when numbers are not between 1-250" do
    v = Validation.invalid_numbers?(300, 0)
    expect(v).to be true
  end

  it "returns false when numbers are between 1-250" do
    v = Validation.invalid_numbers?(120, 152)
    expect(v).to be false
  end

  # isCapitalChar?
  it "returns true when character is capital letter" do
    v = Validation.isCapitalChar?('A')
    expect(v).to be true
  end

  it "returns false when character is not capital letter" do
    v = Validation.isCapitalChar?('a')
    expect(v).to be false
  end

  # valid_I_sequence?
  it "returns true when I sequence is valid" do
    v = Validation.valid_I_sequence?(3,5)
    expect(v).to be true
  end

  it "returns false when I sequence is invalid" do
    v = Validation.valid_I_sequence?(3,'r')
    expect(v).to be false
  end

  # valid_L_sequence?
  it "returns true when L sequence is valid" do
    v = Validation.valid_L_sequence?(3,5,'A')
    expect(v).to be true
  end

  it "returns false when L sequence is invalid" do
    v = Validation.valid_L_sequence?(3,'R',5)
    expect(v).to be false
  end

  # valid_V_H_sequence?
  it "returns true when V/H sequence is valid" do
    v = Validation.valid_V_H_sequence?(3,5,7,'A')
    expect(v).to be true
  end

  it "returns false when V/H sequence is invalid" do
    v = Validation.valid_V_H_sequence?(3,'R',5,6)
    expect(v).to be false
  end

  # isNumber?
  it "returns true when all inputs are numbers" do
    v = Validation.isNumber?([3,5])
    expect(v).to be true
  end

  it "returns false when all inputs are not numbers" do
    v = Validation.isNumber?(['R',5])
    expect(v).to be false
  end

  # pixel_within_range?
  it "returns true when inputs are within image's range" do
    v = Validation.pixel_within_range?(@image,2,3)
    expect(v).to be true
  end

  it "returns false when inputs are not within image's range" do
    v = Validation.pixel_within_range?(@image,8,8)
    expect(v).to be false
  end

  # vertical_within_range?
  it "returns true when inputs are within vertical image's range" do
    v = Validation.vertical_within_range?(@image,2,3,6)
    expect(v).to be true
  end

  it "returns false when inputs are not within vertical image's range" do
    v = Validation.vertical_within_range?(@image,8,3,6)
    expect(v).to be false
  end

  # horizontal_within_range?
  it "returns true when inputs are within horizontal image's range" do
    v = Validation.horizontal_within_range?(@image,2,5,3)
    expect(v).to be true
  end

  it "returns false when inputs are not within horizontal image's range" do
    v = Validation.horizontal_within_range?(@image,1,8,2)
    expect(v).to be false
  end

end