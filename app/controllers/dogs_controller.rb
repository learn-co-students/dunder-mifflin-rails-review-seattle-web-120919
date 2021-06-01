class DogsController < ApplicationController
    before_action :find_dog, only: [:show, :edit]
    def index
        @dogs = Dog.all 
    end

    def new
        @dog = Dog.new
    end

    def create
        @dog = Dog.new(dog_params)
        if @dog.save
            redirect_to @dog 
        else 
            render :new 
        end
    end

    def update
        @dog = Dog.find(params[:id])
        @dog.update(dog_params)
        
        if dog.save
            redirect_to @dog
        else
            render :edit
        end
    end

    private

    def dog_params
        params.require(:dog).permit(:name, :breed, :age)
    end

    def find_dog
        @dog = Dog.find(params[:id])
    end
end
