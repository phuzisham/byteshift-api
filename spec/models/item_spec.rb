require 'rails_helper'

describe Item, 'relations' do
  it { should belong_to :category }
  it { should belong_to :store }
end
