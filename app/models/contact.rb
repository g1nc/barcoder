class Contact < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :notifications
  has_and_belongs_to_many :topics

  before_validation :set_contact_code

  validates :name,  presence: true
  validates :phone, presence: true, uniqueness: true
  validates :token, presence: true, uniqueness: true
  validates :code,  presence: true, uniqueness: true, length: { minimum: 9, maximum: 9 }

  private
    def set_contact_code
      if self.code.blank?
        self.code = rand 100000000...999999999
      end
    end
end
