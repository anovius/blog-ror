class Api::V1::User::UserController < ApplicationController

    def signup
        render json: { errors: "Invalid email" }, status: :unauthorized
    end
end
