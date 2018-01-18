require 'rails_helper'

describe Store, 'associations' do
  it { should have_many :categories_items_stores }
  it { should have_many :categories }
  it { should have_many :items }
end
