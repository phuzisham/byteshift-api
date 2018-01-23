require 'rails_helper'

describe Category, 'relations' do
  it { should belong_to :store }
  it { should have_many :items }
end

describe Category, 'validations' do
  it { should validate_presence_of :name }
  it { should validate_presence_of :lx }
  it { should validate_presence_of :rx }
  it { should validate_presence_of :ty }
  it { should validate_presence_of :by }
  it { should validate_presence_of :store_id }
end

describe Category, 'callbacks' do
  sampleCategory = Category.create(name: 'proDUCE', lx: '0', rx: '7', ty: '8', by: '0', store_id: 1)

  it { is_expected.to callback(:format_name).before(:save) }

  it 'will titleize name' do
    expect(sampleCategory.name).to(eq('Produce'))
  end
end
