class NumberOfDay < ActiveHash::Base
  self.data = [
    { id: 1, id: '---' },
    { id: 2, id: '1\~2日で発送' },
    { id: 3, id: '2\~3日で発送' },
    { id: 4, id: '4\~7日で発送' },
  ]

  include ActiveHash::Associations
  has_many :items

  end