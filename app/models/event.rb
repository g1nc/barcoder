class Event < ApplicationRecord
  belongs_to :topic
  delegate :user, :to => :topic
  delegate :contacts, :to => :topic

  validates :title, presence: true
  validates :date, presence: true
  validates :time, presence: true
end
