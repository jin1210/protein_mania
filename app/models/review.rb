class Review < ApplicationRecord

  belongs_to :user
  belongs_to :item

  enum ease: { ease_poor: 0, ease_good: 1, ease_excellent: 2 }
  enum taste: { taste_poor: 0, taste_good: 1, taste_excellent: 2 }
  enum purpose: { muscle: 0, diet: 1, others: 2 }

  validates :ease, presence: true
  validates :taste, presence: true
  validates :purpose, presence: true

end
