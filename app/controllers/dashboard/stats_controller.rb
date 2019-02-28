module Dashboard
  class StatsController < ApplicationController
    def show

    end


    private

    def load_link
      @link = Link.find_by!(uuid: params[:uuid])
    end
  end
end
