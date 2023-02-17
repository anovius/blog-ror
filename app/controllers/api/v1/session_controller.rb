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
        user = User.where(authentication_token: params[:id]).first
        if user
            user.authentication_token = nil
            user.save!
            head 204
        else
            head 404
        end
    end
end
