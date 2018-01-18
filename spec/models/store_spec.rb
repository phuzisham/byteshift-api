require 'rails_helper'

describe Store, 'relations' do
  it { should have_many :categories }
  it { should have_many :items }
end

describe Store, 'callbacks' do
  sampleStore = Store.create(:name => 'neW SeaSoNS MARket', :address => '8932 Easy Street', :phone => '(984)-2237777', :hours => '8-7 All Week')

  it { is_expected.to callback(:case_fields).before(:save) }

  it 'will titleize name' do
    expect(sampleStore.name).to(eq('New Seasons Market'))
  end
end
