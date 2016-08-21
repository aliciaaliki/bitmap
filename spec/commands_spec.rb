Dir["./app/commands/*.rb"].each {|file| require file }

describe 'Commands' do

  before do
    allow(STDOUT).to receive(:puts)
    @image = Image.new(5, 6)
  end

  # I sequence

  it "validates valid I input with error" do
    expect { Commands::CreateImage.create(6, 7) }.to_not raise_error
  end

  it "validates invalid I input with error" do
    expect { Commands::CreateImage.create("A", 6, 7) }.to raise_error(ArgumentError)
  end

  it "validates invalid I input with error" do
    expect{ Commands::CreateImage.create("A", 6) }.to raise_error("#{Error.not_valid_I_command}")
  end

  it "validates I input with error for error for image size" do
    expect{ Commands::CreateImage.create(251,300) }.to raise_error("#{Error.invalid_numbers_error}")
  end

  # L sequence

  it "validates L input successfully" do
    expect { Commands::ColourPixel.colour(@image, 2, 3, "B") }.to_not raise_error
  end

  it "validates invalid L sequence with error" do
    expect { Commands::ColourPixel.colour(@image, "A", 5, "B") }.to raise_error("#{Error.not_valid_L_command}")
  end

  it "validates invalid L sequence with error about arguments input" do
    expect { Commands::ColourPixel.colour(@image, 3, 5, "B", 8) }.to raise_error(ArgumentError)
  end

  it "validates L invalid sequence with error for image size" do
    expect { Commands::ColourPixel.colour(@image, 40, 40, "E") }.to raise_error("#{Error.image_size_error(@image)}")
  end

  # V sequence

  it "validates V input successfully" do
    expect { Commands::ColourVertical.colour_vertical(@image, 2, 3, 6, "X") }.to_not raise_error
  end

  it "validates invalid V sequence with error" do
    expect { Commands::ColourVertical.colour_vertical(@image, 2, 3, 6, 40) }.to raise_error("#{Error.not_valid_V_command}")
  end

  it "validates invalid V sequence with error" do
    expect { Commands::ColourVertical.colour_vertical(@image, 2, 3, 6, 40, "E") }.to raise_error(ArgumentError)
  end

  it "validates invalid V sequence with error for image size" do
    expect { Commands::ColourVertical.colour_vertical(@image, 20, 30, 40, "R") }.to raise_error("#{Error.image_size_error(@image)}")
  end

  # H sequence

  it "validates H input successfully" do
    expect { Commands::ColourHorizontal.colour_horizontal(@image, 2, 1, 6, "W") }.to_not raise_error
  end

  it "validates invalid H sequence with error" do
    expect { Commands::ColourHorizontal.colour_horizontal(@image, 2, 3, 4, 40) }.to raise_error("#{Error.not_valid_H_command}")
  end

  it "validates invalid H sequence with error" do
    expect { Commands::ColourHorizontal.colour_horizontal(@image, 40) }.to raise_error(ArgumentError)
  end

  it "validates invalid H sequence with error for image size" do
    expect { Commands::ColourHorizontal.colour_horizontal(@image, 22, 33, 44, "B") }.to raise_error("#{Error.image_size_error(@image)}")
  end

  # S sequence

  it "validates S input successfully" do
    expect { Commands::ShowImage.show(@image) }.to_not raise_error
  end

  # C sequence

  it "validates C input successfully" do
    Commands::ColourHorizontal.colour_horizontal(@image, 2, 1, 6, "W")
    Commands::ColourVertical.colour_vertical(@image, 2, 3, 6, "X")
    expect { Commands::ClearImage.clear(@image) }.to_not raise_error
  end


end