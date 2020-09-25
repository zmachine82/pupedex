class PuppiesController < ApplicationController
    before_action :set_puppy, only: [:show, :update, :destroy]
    skip_before_action :authenticate, only: [:index, :show]

    def index
        @puppies = Puppy.all
        render json: { puppies: @puppies }
    end

    def show
        @reviews = Review.where(puppy_id: params[:id])
        reviewArray = []
        @reviews.each do |r|
            reviewArray.push(
            {
                body: r.body,
                username: r.user.nickname,
                id: r.id,
                rating: r.rating,
                created_at: r.created_at
            })
        end
        averageRating = Review.where(puppy_id: params[:id]).average(:rating)
        if averageRating
            averageRating = averageRating.round(2)
        end
        render json: { puppy: @puppy, reviews: reviewArray, averageRating: averageRating   }                                                                                 
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
        params.require(:puppy).permit(:name, :age, :breed, :size, :image)
    end
end
