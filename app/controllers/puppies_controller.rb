class PuppiesController < ApplicationController
    def index
        @puppies = Puppy.all
        render json: @puppies, include: [name, age, size, breed]
    end

    def show
        render json: @puppy
    end

    def create
        @puppies = Puppy.new(puppy_params)
        if @puppy.save
            render json: @puppy, status: :created
        else
            render json: @puppy.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @puppies.destroy
    end

    def update
        if @puppy.update(puppy_params)
            render json: @puppy
        else 
            render json: @puppy.errors, status: :unprocessable_entity
        end
    end

    def locate_puppy
        @puppy = Puppy.find(params[:id])
    end

    def puppy_params
        params.requires(:puppy).permit(:name, :age, :size, :breed)
    end
end
