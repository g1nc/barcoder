class Contact < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :phone, presence: true
  validates :token, presence: true
end
