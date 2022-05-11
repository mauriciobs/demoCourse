class Api::ServicesController < ApplicationController
    def index

    end
    def getData
        render :json => {  :test => 'hetestllo' }
    end
end