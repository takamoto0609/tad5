class WashPower < ActiveHash::Base
  self.data = [
    { id: 1, name: '4.5Kg' },
    { id: 2, name: '5Kg' },
    { id: 3, name: '6Kg' },
    { id: 4, name: '7Kg' },
    { id: 5, name: '8Kg' },
    { id: 6, name: '9Kg' },
    { id: 7, name: '10Kg' },
    { id: 8, name: '11Kg' },
    { id: 9, name: '12Kg' },
  ]

  include ActiveHash::Associations
  has_many :items
end
