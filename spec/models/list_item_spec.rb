require 'rails_helper'

describe ListItem, 'relations' do
  it { should belong_to :list }
  it { should belong_to :item }
end

describe ListItem, 'validations' do
  it { should validate_presence_of :name }
end
