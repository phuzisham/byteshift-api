FactoryBot.define do
  factory :item do
    name('cheese')
    x(2)
    y(4)
    # implicitly calls the factory :store
    store
    # implicitly calls the factory :category
    category
  end
end
