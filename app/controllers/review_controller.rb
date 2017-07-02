class ReviewController < ApplicationController


  get '/reviews' do
    erb :"reviews/index"
  end

  get '/reviews/new' do
    erb :"reviews/new"
  end

  post '/reviews' do
    @rating = []
    @food = []
    @cost = []

    @user = User.find_or_create_by(params[:review][:user])

    params[:review][:rating].each_with_index do |rating, index|
      @rating << Review.create(rating)
      @rating[index].user_id = @user.id
      @rating[index].save
      #review needs restaurant_id
    end

    params[:review][:food].each do |food|
      @food << Food.create(food)
    end

    params[:review][:restaurant_foods].each_with_index do |cost, index|
      @cost << RestaurantFood.create(cost)
      @cost[index].food_id = @food[index].id
      @cost[index].review_id = @rating[index].id
      @cost[index].save
      #restaurant_foods needs restaurant_id
    end

    redirect '/reviews'
  end

  get '/reviews/:id' do
    @review = Review.find(params[:id])
    @user = User.find(@review.user_id)
    @restaurant_food = RestaurantFood.find_by(review_id: @review.id)
    @food = Food.find(@restaurant_food.food_id)
    erb :"reviews/show"
  end

  get '/reviews/:id/edit' do
    @review = Review.find(params[:id])
    @user = User.find(@review.user_id)
    @restaurant_food = RestaurantFood.find_by(review_id: @review.id)
    @food = Food.find(@restaurant_food.food_id)
    erb :"reviews/edit"
  end

  patch '/reviews/:id' do
    @review = Review.find(params[:id])
    @user = User.find(@review.user_id)
    @restaurant_food = RestaurantFood.find_by(review_id: @review.id)
    @food = Food.find(@restaurant_food.food_id)
    @review.update(params[:review][:rating])
    @user.update(params[:review][:user])
    @restaurant_food.update(params[:review][:restaurant_foods])
    @food.update(params[:review][:food])
    redirect "/reviews/#{params[:id]}"
  end

  delete '/reviews/:id/delete' do
    Review.delete(params[:id])
    redirect '/reviews'
  end

end
