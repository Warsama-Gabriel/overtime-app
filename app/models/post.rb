class Post < ApplicationRecord
  validates :rationale, :date, presence: true
end
