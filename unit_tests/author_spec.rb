require_relative '../game/author'

describe Author do
  it 'inserted data should be equal to attributes' do
    new_author = Author.new('Jim', 'Jones')

    name = new_author.first_name

    expect(name).to eq 'Jim'
  end

  it 'items array should be populated' do
    new_author = Author.new('Jim', 'Jones')
    item = Item.new('2020/12/15')
    new_author.add_items(item)

    item_array = new_author.items

    expect(item_array.length).not_to be 0
  end
end
