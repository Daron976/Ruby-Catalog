require_relative '../item/book'
require 'date'

describe Book do
  before :each do
    @book = Book.new('Ithaki', 'good', '2010-01-10')
  end
  it 'return item' do
    @book.should be_an_instance_of Book
  end

  it 'return the state' do
    expect(@book.cover_state).to eq('good')
  end

  it 'return publsh date' do
    expect(@book.publish_date).to eq(Date.parse('10-01-2010'))
  end
end
