class DogsController < ApplicationController

    def index
        @dogs = Dog.all
    end

    def show 
        # finding dog using information from our URL 
        @dog = Dog.find(params[:id])
    end
end
