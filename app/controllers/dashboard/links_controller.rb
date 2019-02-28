module Dashboard
  class LinksController < ApplicationController
    def new #TODO replace home with this action
      @link = Link.new
    end

    def create
      save_link or render :new
    end

    def show
      load_link
    end

    private

    def build_link
      @link = Link.new(new_link_params)
    end

    def save_link
      result = ::CreateLink.new(attributes: new_link_params).call
      @link = result.object

      if result.success
        redirect_to dashboard_link_path(result.object), notice: 'Link saved'
      end
    end

    def load_link
      @link = Link.find_by!(uuid: params[:uuid])
    end

    def new_link_params
      params.require(:link).permit(:full_url)
    end
  end
end
