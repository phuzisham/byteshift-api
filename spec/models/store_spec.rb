require 'rails_helper'

describe Store, 'relations' do
  it { should have_many :categories }
  it { should have_many :items }
end
