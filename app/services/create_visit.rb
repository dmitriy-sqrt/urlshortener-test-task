class CreateVisit < ::BaseService
  def initialize(link:, request:)
    @link    = link
    @request = request
  end

  def call
    if save_visit
      return Result.new(success: true, object: @visit)
    else
      return Result.new(success: false, errors: @visit.errors)
    end
  end

  private

  def save_visit
    @visit = @link.visits.new(request_info)
    @visit.save
  end

  def request_info
    {
      ip:         @request.remote_ip,
      referrer:   @request.referrer,
      user_agent: @request.user_agent
    }
  end
end
