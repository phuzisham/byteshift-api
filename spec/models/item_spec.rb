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
  sampleItem = FactoryBot.create(:item)

  it { is_expected.to callback(:format_name).before(:save) }

  it 'will titleize name' do
    expect(sampleItem.name).to(eq('Cheese'))
  end
end
