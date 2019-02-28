class Url < ApplicationRecord
  validates :uuid, presence: true, uniqueness: true
  validates :full_url, presence: true
  #validates :secret, presence: true # TODO
end
