class Api::V1::SessionController < ApplicationController

    def create
        user = User.where(email: params[:email]).first
        if user
            if user.valid_password?(params[:password])
                render json: user.toAuthJSON, status: :created
            else
                render json: { errors: "Invalid password" }, status: :unauthorized
            end
        else
            render json: { errors: "Invalid email" }, status: :unauthorized
        end
    end

    def destroy
    end
end
