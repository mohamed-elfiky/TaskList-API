class TlistsController < ApplicationController
    # get /tlists
    def index 
        @tlists = Tlist.all
        render json: @tlists.to_json
    end

    def show
        @tlist = Tlist.find(params[:id])
        render json: @tlist.to_json
    end

end
