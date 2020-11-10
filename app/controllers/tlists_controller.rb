class TlistsController < ApplicationController
    # get /tlists
    def index 
        @tlists = Tlist.all
        render json: @tlists.to_json
    end

end
