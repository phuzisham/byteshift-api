require 'rails_helper'

describe List, 'relations' do
  it { should belong_to :account }
  it { should belong_to :store }
  it { should have_many :list_items }
end
