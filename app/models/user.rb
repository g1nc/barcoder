class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :contacts,      :dependent => :delete_all
  has_many :notifications, :dependent => :delete_all
  has_many :topics,        :dependent => :delete_all
  has_many :events,        :dependent => :delete_all, :through => :topics
end
