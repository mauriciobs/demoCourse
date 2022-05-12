class Api::ServicesController < ApplicationController
    def index

    end
    def getUserList
        users = User.select(:id, :name, :email)
        render :json => {  :users => users }
    end
    def searchUserEmail
        user = User.select(:id, :name).where(email: params[:email]).take
        render :json => {  :user => user  }
    end
    def changeUserName
        user = User.find(params[:id])
        user.name = params[:name]
        user.save 
        render :json => {  :user => user  }
    end
end