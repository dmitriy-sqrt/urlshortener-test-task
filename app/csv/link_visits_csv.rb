# could possibly use same decorator as one for html
require 'csv'

class LinkVisitsCsv
  def initialize(visits)
    @visits = visits
  end

  def to_s
    CSV.generate do |csv|
      csv << [
        'Time',
        'Ip',
        'User agent',
        'Referrer'
      ]

      @visits.each do |visit|
        csv << [
          visit.created_at,
          visit.ip,
          visit.user_agent,
          visit.referrer
        ]
      end
    end
  end
end
