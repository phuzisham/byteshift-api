require 'rails_helper'

describe Category, 'relations' do
  it { should belong_to :store }
  it { should have_many :items }
end
