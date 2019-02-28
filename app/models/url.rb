# IMPROV: validate url accessibility by http querying
class Url < ApplicationRecord
  validates :uuid,     presence: true, uniqueness: true
  validates :full_url, presence: true
  validate  :valid_full_url?
  #validates :secret, presence: true # TODO

  private

  def valid_full_url?
    unless full_url =~ /^#{URI::regexp}$/
      errors.add(:full_url, 'is not a valid url')
    end
  end
end
