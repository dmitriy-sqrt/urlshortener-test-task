module Dashboard
  class StatsController < ApplicationController
    def show
      load_link
      load_visits

      respond_to do |format|
        format.html {}
        format.csv  { render_csv }
      end
    end

    private

    def load_link
      @link = Link.find_by!(secret: params[:secret])
    end

    def load_visits
      @visits = @link.visits.order('created_at DESC')
    end

    def render_csv
      csv = ::LinkVisitsCsv.new(@visits).to_s

      headers['Content-Disposition'] =
        "attachment; filename=link-stats-#{@link.uuid}.csv"
      render plain: csv, content_type: 'text/csv'
    end
  end
end
