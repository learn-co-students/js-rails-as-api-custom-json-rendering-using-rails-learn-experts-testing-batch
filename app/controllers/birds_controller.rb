class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: {id: bird.id, name: bird.name, species: bird.species }
    # render json: bird.slice(:id, :name, :species)
    # render json: bird, only: [:id, :name, :species]
    # render json: bird, except: [:created_at, :updated_at]
    else
      render json: {message: "Bird not found"}
    end
  end
end