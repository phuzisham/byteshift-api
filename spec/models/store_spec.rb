require 'rails_helper'

describe Store, 'relations' do
  it { should have_many :categories }
  it { should have_many :items }
end

describe Store, 'validations' do
  it { should validate_presence_of :name }
  it { should validate_presence_of :address }
  it { should validate_presence_of :phone }
  it { should validate_presence_of :hours }
end

describe Store, 'callbacks' do
  sampleStore = Store.create(:name => 'neW SeaSoNS MARket', :address => '8932 pine ave portland or 97201', :phone => '984-223777 7', :hours => '8-7 All Week')

  it { is_expected.to callback(:format_fields).before(:save) }

  it 'will titleize name' do
    expect(sampleStore.name).to(eq('New Seasons Market'))
  end

  it 'will format phone number' do
    expect(sampleStore.phone).to(eq('(984) 223-7777'))
  end

  it 'will format address' do
    expect(sampleStore.address).to(eq('8932 Pine Ave, Portland, OR 97201'))
  end
end
