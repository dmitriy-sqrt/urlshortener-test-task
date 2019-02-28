module Dashboard
  class UrlsController < ApplicationController
    def new #TODO replace home with this action
      @url = Url.new
    end

    def create
      save_url or render :new
    end

    def show
      load_url
    end

    private

    def build_url
      @url = Url.new(new_url_params)
    end

    def save_url
      result = ::CreateUrl.new(attributes: new_url_params).call
      @url = result.object

      if result.success
        redirect_to dashboard_url_path(result.object), notice: 'Url saved'
      end
    end

    def load_url
      @url = Url.find_by!(uuid: params[:uuid])
    end

    def new_url_params
      params.require(:url).permit(:full_url)
    end
  end
end
