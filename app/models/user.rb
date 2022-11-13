class User < ApplicationRecord
  validates :name, presence: true

  has_many :groups, inverse_of: 'author', foreign_key: 'author_id'
  has_many :purchases, inverse_of: 'author', foreign_key: 'author_id'


end
