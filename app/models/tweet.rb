class Tweet < ApplicationRecord
  belongs_to :user

  scope :from_colleuges, -> (colleuges) { where(user_id: colleuges) }
end
