class LinksController < ApplicationController
  def show
    load_link
    track_visit
    redirect_to @link.full_url
  end

  private

  def uuid
    params[:uuid]
  end

  def load_link
    @link = Link.find_by!(uuid: uuid)
  end

  def track_visit
    CreateVisit.new(link: @link, request: request).call
  end
end
