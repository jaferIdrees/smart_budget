class Purchase < ApplicationRecord
  validates :name, presence: true

  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :groups
end
