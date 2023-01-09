require './label'

describe Label do
  before :each do
    @label = Label.new 'Ruby', 'Red'
  end

  it 'return label title' do
    expect(@label.title).to eq 'Ruby'
  end

  it 'return label color' do
    expect(@label.color).to eq 'Red'
  end
end
