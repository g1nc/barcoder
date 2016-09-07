class Notification < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :contacts

  validates :text, presence: true
end
