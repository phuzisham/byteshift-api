require 'rails_helper'

describe List, 'relations' do
  it { should belong_to :account }
  it { should belong_to :store }
  it { should have_many :list_items }
end

describe List, 'validations' do
  it { should validate_presence_of :account_id }
  it { should validate_presence_of :store_id }
  it { should validate_numericality_of(:account_id).only_integer }
  it { should validate_numericality_of(:store_id).only_integer }
end
