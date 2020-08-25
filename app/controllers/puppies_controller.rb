class PuppiesController < ApplicationController
    before_action :set_puppy, only:[:show, :update, :destroy]

    def index
        @puppies = Puppy.all
        render json: @puppies
    end

    def show
        render json: {puppy: @puppy}
    end

    def create
        @puppy = Puppy.new(puppy_params)
        if @puppy.save
            render json: @puppy, status: :created
        else
            render json: @puppy.errors, status: :unprocessable_entity
        end
    end

    def update
        if @puppy.update(puppy_params)
            render json: @puppy 
        else
            render json: @puppy.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @puppy.destroy
    end

    private

    def set_puppy
        @puppy = Puppy.find(params[:id])
    end

    def puppy_params
        params.require(:puppy).permit(:name, :age, :breed, :size)
    end
end
