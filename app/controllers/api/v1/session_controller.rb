class Api::V1::SessionController < ApplicationController

    def create
        user = User.where(email: params[:email]).first

        # console log user to see what it returns

        puts "prarams: #{params[:email]}"

        if user
            if user.valid_password?(params[:password])
                render json: user.as_json(only: [:id, :email]), status: :created
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
