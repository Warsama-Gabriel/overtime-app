class Post < ApplicationRecord
  belongs_to :user
  validates :rationale, :date, presence: true


end
