Dir["./app/commands/*.rb"].each {|file| require file }

describe 'Commands' do

  let(:image){ Image.new(5,6) }

  before do
    allow(STDOUT).to receive(:puts)
  end

  describe "Commands::CreateImage.create" do
    it "validates valid CreateImage input successfully" do
      expect { Commands::CreateImage.perform(6, 7) }.to_not raise_error
    end

    it "validates invalid CreateImage input with error" do
      expect { Commands::CreateImage.perform("A", 6, 7) }.to raise_error(ArgumentError)
    end

    it "validates invalid CreateImage input with error" do
      expect{ Commands::CreateImage.perform("A", 6) }.to raise_error("#{Error.not_valid_create_command}")
    end

    it "validates CreateImage input with error about image's size" do
      expect{ Commands::CreateImage.perform(251,300) }.to raise_error("#{Error.invalid_numbers_error}")
    end
  end

  describe "Commands::ColourPixel.colour" do
    it "validates ColourPixel input successfully" do
      expect { Commands::ColourPixel.perform(image, 2, 3, "B") }.to_not raise_error
    end

    it "validates invalid ColourPixel input with error" do
      expect { Commands::ColourPixel.perform(image, "A", 5, "B") }.to raise_error("#{Error.not_valid_colour_command}")
    end

    it "validates invalid ColourPixel input with error about arguments input" do
      expect { Commands::ColourPixel.perform(image, 3, 5, "B", 8) }.to raise_error(ArgumentError)
    end

    it "validates ColourPixel invalid sequence with error about image's size" do
      expect { Commands::ColourPixel.perform(image, 40, 40, "E") }.to raise_error("#{Error.image_size_error(image)}")
    end
  end

  describe "Commands::ColourVertical.colour_vertical" do
    it "validates V input successfully" do
      expect { Commands::ColourVertical.perform(image, 2, 3, 6, "X") }.to_not raise_error
    end

    it "validates invalid V sequence with error" do
      expect { Commands::ColourVertical.perform(image, 2, 3, 6, 40) }.to raise_error("#{Error.not_valid_vertical_command}")
    end

    it "validates invalid V sequence with error about arguments input" do
      expect { Commands::ColourVertical.perform(image, 2, 3, 6, 40, "E") }.to raise_error(ArgumentError)
    end

    it "validates invalid V sequence with error about image's size" do
      expect { Commands::ColourVertical.perform(image, 20, 30, 40, "R") }.to raise_error("#{Error.image_size_error(image)}")
    end
  end

  describe "Commands::ColourHorizontal.colour_horizontal" do
    it "validates H input successfully" do
      expect { Commands::ColourHorizontal.perform(image, 2, 1, 6, "W") }.to_not raise_error
    end

    it "validates invalid H sequence with error" do
      expect { Commands::ColourHorizontal.perform(image, 2, 3, 4, 40) }.to raise_error("#{Error.not_valid_horizontal_command}")
    end

    it "validates invalid H sequence with error about arguments input" do
      expect { Commands::ColourHorizontal.perform(image, 40) }.to raise_error(ArgumentError)
    end

    it "validates invalid H sequence with error about image's size" do
      expect { Commands::ColourHorizontal.perform(image, 22, 33, 44, "B") }.to raise_error("#{Error.image_size_error(image)}")
    end
  end

  it "validates show image input successfully" do
    expect { Commands::ShowImage.perform(image) }.to_not raise_error
  end

  it "validates clear image input successfully" do
    Commands::ColourHorizontal.perform(image, 2, 1, 6, "W")
    Commands::ColourVertical.perform(image, 2, 3, 6, "X")
    expect { Commands::ClearImage.perform(image) }.to_not raise_error
  end

end