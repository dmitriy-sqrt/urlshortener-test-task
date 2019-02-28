class Visit < ApplicationRecord
  belongs_to :url

  validates :url, presence: true
end
