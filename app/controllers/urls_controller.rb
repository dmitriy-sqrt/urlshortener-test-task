class UrlsController < ApplicationController
  def show
    url = Url.find_by!(uuid: uuid)
    head :ok
  end

  private

  def uuid
    params[:uuid]
  end
end
