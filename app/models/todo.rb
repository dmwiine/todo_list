class Todo < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy

  validates :title, :user, presence: true
end
