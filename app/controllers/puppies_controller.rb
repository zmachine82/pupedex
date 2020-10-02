class PuppiesController < ApplicationController
    before_action :set_puppy, only: [:show, :update, :destroy]
    skip_before_action :authenticate, only: [:index, :show]

    def index
        @puppies = Puppy.all
        render json: { puppies: @puppies }
    end

    def show
        render json: @puppy, include: ['reviews', 'users'],  methods: :average_rating                                                                               
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

    def favorite
        favorite = Favorite.where(puppy_id: params[:puppy_id], user_id: @current_user.id)
        if favorite.size > 0
            favorite.delete_all
            render json: {favorite: false}
        else
            fav = Favorite.new(puppy_id: params[:puppy_id], user_id: @current_user.id)
            fav.save
            render json: {favorite: true}
        end
    end

    private

    def set_puppy
        @puppy = Puppy.find(params[:id])
    end

    def puppy_params
        params.require(:puppy).permit(:name, :age, :breed, :size, :image)
    end
end
