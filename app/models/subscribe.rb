class Subscribe < ApplicationRecord
  belongs_to :topic
  belongs_to :contact
end
