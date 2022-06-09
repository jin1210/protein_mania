class Review < ApplicationRecord

  belongs_to :user
  belongs_to :item

  enum ease: { poor: 0, good: 1, excellent: 2 }
  enum taste: { poor: 0, good: 1, excellent: 2 }
  enum purpose: { muscle: 0, diet: 1, others: 2 }

end
