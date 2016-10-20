class Topic < ApplicationRecord
  has_many :events, :dependent => :delete_all
  has_many :subscribes, :dependent => :delete_all
  has_many :notifications, :dependent => :delete_all
  has_many :subscribes, :dependent => :delete_all
  belongs_to :user

  validates :title, presence: true
end
