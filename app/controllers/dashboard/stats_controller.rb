module Dashboard
  class StatsController < ApplicationController
    def show
      load_link
    end

    private

    def load_link
      @link = Link.find_by!(secret: params[:secret])
    end
  end
end
