class UrlsController < ApplicationController
  def show
    url = Url.find_by!(uuid: uuid)
    redirect_to url.full_url
  end

  private

  def uuid
    params[:uuid]
  end
end
