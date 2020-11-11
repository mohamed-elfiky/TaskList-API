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

    def create
        @tlist = Tlist.create!(tlist_params)
        render json:  @tlist , status: :created 
    end

    private
    ###### strong params  #####
    def tlist_params
        params.permit(:name, :owner)
    end

end
