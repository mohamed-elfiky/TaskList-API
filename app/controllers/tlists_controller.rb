class TlistsController < ApplicationController

    def index 
        @tlists = Tlist.all
        render json: @tlists
    end

    def show
        @tlist = Tlist.find(params[:id])
        render json: @tlist
    end

    def create
        @tlist = Tlist.create!(tlist_params)
        render json:  @tlist , status: :created 
    end

    def update 
        @tlist = Tlist.find(params[:id]) # shall raise exception if not found
        Tlist.update(tlist_params)
        head :ok
    end

    private
    ###### strong params  #####
    def tlist_params
        params.permit(:name, :owner)
    end

end
