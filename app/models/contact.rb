class Contact < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :notifications

  validates :name, presence: true
  validates :phone, presence: true
  validates :token, presence: true
end
