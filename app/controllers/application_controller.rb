class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound do |e|
        render json: e.message, status: :not_found
    end
end 
