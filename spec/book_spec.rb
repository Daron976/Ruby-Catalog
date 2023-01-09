require './book'

describe Book do
  before :each do
    @book = Book.new('ITHAKI', 'Perfect', '11-11-2010')
  end

  it 'return cover-state condition' do
    expect(@book.cover_state).to eq('Perfect')
  end

  it 'return publisher' do
    expect(@book.publisher).to eq('ITHAKI')
  end

  it 'return publish-date' do
    expect(@book.publish_date).to eq('11-11-2010')
  end
end
