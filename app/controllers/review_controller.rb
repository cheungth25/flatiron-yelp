class ReviewController < ApplicationController

  get '/reviews/new' do
    erb :"reviews/new"
  end

  get '/reviews' do
    erb :"reviews/index"
  end

  post '/reviews' do
    @rating = []
    @food = []
    @cost = []

    @user = User.create(params[:review][:user])
    params[:review][:rating].each_with_index do |rating, index|
      @rating << Review.create(rating)
      @rating[index].user_id = @user.id
      @rating[index].save
    end

    params[:review][:food].each do |food|
      @food << Food.create(food)
    end

    params[:review][:restaurant_foods].each_with_index do |cost, index|
      @cost << RestaurantFood.create(cost)
      @cost[index].food_id = @food[index].id
      @cost[index].save
      #retaurant_foods needs restaurant_id
    end


    redirect '/reviews'
  end

  get '/reviews/:id' do
    @review = Review.find(params[:id])
    erb :"reviews/show"
  end

end
