class Topic < ApplicationRecord
  has_many :events, :dependent => :delete_all
  has_many :contacts
  has_many :notifications
  has_and_belongs_to_many :contacts
  belongs_to :user

  validates :title, presence: true
end
