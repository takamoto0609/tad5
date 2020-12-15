class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: '準備中' },
    { id: 2, name: '受付中' },
    { id: 3, name: '本日終了' },
  ]

  include ActiveHash::Associations
  has_many :items
end