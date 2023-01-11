require './book'

require 'date'

describe Book do
  before :each do
   @book = Book.new('Ithaki', 'good', '10-01-2010')
  end
  it 'return item' do
    @book.should be_an_instance_of Book
  end

  it 'return the state' do
    expect(@book.cover_state).to eq('good')
  end

  it 'return publsh date' do
    expect(@book.publish_date).to eq('10-01-2010')
  end
end