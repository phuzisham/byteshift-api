FactoryBot.define do
  factory :category do
    name('dairy')
    lx(3)
    rx(2)
    ty(1)
    by(5)
    # Since a store is ideally created first I told FactoryBot to use the last created store OR create new one
    store { Store.last || create(:store) }
  end
end
