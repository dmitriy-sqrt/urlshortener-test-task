module Dashboard
  class StatsController < ApplicationController
    def show

    end


    private

    def load_url
      @url = Url.find_by!(uuid: params[:uuid])
    end
  end
end
