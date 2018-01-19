require 'rails_helper'

describe Item, 'relations' do
  it { should belong_to :category }
  it { should belong_to :store }
end

describe Item, 'validations' do
  it { should validate_presence_of :name }
  it { should validate_presence_of :x }
  it { should validate_presence_of :y }
  it { should validate_presence_of :store_id }
  it { should validate_presence_of :category_id }
end

describe Item, 'callbacks' do
  sampleItem = Item.create(:name => 'aPPle', :x => '3', :y => '7', :store_id => 1, :category_id => 1)

  it { is_expected.to callback(:format_name).before(:save) }

  it 'will titleize name' do
    expect(sampleItem.name).to(eq('Apple'))
  end
end
