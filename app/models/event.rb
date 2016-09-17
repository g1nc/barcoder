class Event < ApplicationRecord
  belongs_to :topic
  delegate :user, :to => :topic

  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
end