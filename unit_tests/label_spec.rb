require './item/rel/label'

require './item/book'

describe Label do
  before :each do
    @label = Label.new 'Dark Tower', 'Black'
    @book = Book.new 'Emre', 'Perfect', '12-11-2005'
  end

  it 'returns 1 Book with a label' do
    @label.add_item(@book)

    expect(@label.items.length).to eq 1
  end
end
