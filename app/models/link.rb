# IMPROV: validate url accessibility by http querying
class Link < ApplicationRecord
  has_many :visits

  validates :uuid,     presence: true, uniqueness: true
  validates :full_url, presence: true
  validate  :valid_full_url?
  validates :secret, presence: true

  def to_param
    self.uuid # for using default path helpers, like some_path(link)
  end

  private

  def valid_full_url?
    unless full_url =~ /^#{URI::regexp}$/
      errors.add(:full_url, 'is not a valid link')
    end
  end
end
