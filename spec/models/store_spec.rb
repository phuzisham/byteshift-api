require 'rails_helper'

describe Store, 'associations' do
  it { should have_many :categories }
  it { should have_many :items }
end
