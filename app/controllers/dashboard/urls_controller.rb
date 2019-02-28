module Dashboard
  class UrlsController < ApplicationController
    def create
      result = ::CreateUrl.new(attributes: new_url_params).call

      if result.success
        redirect_to dashboard_url_path(result.object), notice: 'Url saved'
      else
        raise 'shit'
      end
    end

    def show
      load_url
    end

    private

    def load_url
      @url = Url.find(params[:id])
    end

    def new_url_params
      params.require(:url).permit(:full_url)
    end
  end
end
