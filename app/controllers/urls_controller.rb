class UrlsController < ApplicationController
  def show
    load_url
    track_visit
    redirect_to @url.full_url
  end

  private

  def uuid
    params[:uuid]
  end

  def load_url
    @url = Url.find_by!(uuid: uuid)
  end

  def track_visit
    CreateVisit.new(url: @url, request: request).call
  end
end
