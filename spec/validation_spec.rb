require_relative '../app/validation'
require_relative '../app/image'

describe 'Validation' do

  let(:image){ Image.new(5, 6) }

  describe "invalid_numbers?" do
    it "returns true when numbers are not between 1-250" do
      v = Validation.invalid_numbers?(300, 0)
      expect(v).to be true
    end

    it "returns false when numbers are between 1-250" do
      v = Validation.invalid_numbers?(120, 152)
      expect(v).to be false
    end
  end

  describe "capital_char?" do
    it "returns true when character is capital letter" do
      v = Validation.capital_char?('A')
      expect(v).to be true
    end

    it "returns false when character is not capital letter" do
      v = Validation.capital_char?('a')
      expect(v).to be false
    end
  end

  describe "valid_image_sequence?" do
    it "returns true when I sequence is valid" do
      v = Validation.valid_image_sequence?(3,5)
      expect(v).to be true
    end

    it "returns false when I sequence is invalid" do
      v = Validation.valid_image_sequence?(3,'r')
      expect(v).to be false
    end
  end

  describe "valid_colour_sequence?" do
    it "returns true when colour sequence is valid" do
      v = Validation.valid_colour_sequence?(3,5,'A')
      expect(v).to be true
    end

    it "returns false when colour sequence is invalid" do
      v = Validation.valid_colour_sequence?(3,'R',5)
      expect(v).to be false
    end
  end

  describe "valid_vertical_horizontal_sequence?" do
    it "returns true when vertical or horizontal sequence is valid" do
      v = Validation.valid_vertical_horizontal_sequence?(3,5,7,'A')
      expect(v).to be true
    end

    it "returns false when vertical or horizontal sequence is invalid" do
      v = Validation.valid_vertical_horizontal_sequence?(3,'R',5,6)
      expect(v).to be false
    end
  end

  describe "number?" do
    it "returns true when all inputs are numbers" do
      v = Validation.number?([3,5])
      expect(v).to be true
    end

    it "returns false when all inputs are not numbers" do
      v = Validation.number?(['R',5])
      expect(v).to be false
    end
  end

  describe "pixel_within_range?" do
    it "returns true when inputs are within image's range" do
      v = Validation.pixel_within_range?(image,2,3)
      expect(v).to be true
    end

    it "returns false when inputs are not within image's range" do
      v = Validation.pixel_within_range?(image,8,8)
      expect(v).to be false
    end
  end

  describe "vertical_within_range?" do
    it "returns true when inputs are within vertical image's range" do
      v = Validation.vertical_within_range?(image,2,3,6)
      expect(v).to be true
    end

    it "returns false when inputs are not within vertical image's range" do
      v = Validation.vertical_within_range?(image,8,3,6)
      expect(v).to be false
    end
  end

  describe "horizontal_within_range?" do
    it "returns true when inputs are within horizontal image's range" do
      v = Validation.horizontal_within_range?(image,2,5,3)
      expect(v).to be true
    end

    it "returns false when inputs are not within horizontal image's range" do
      v = Validation.horizontal_within_range?(image,1,8,2)
      expect(v).to be false
    end
  end

end