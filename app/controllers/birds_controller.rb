require "pry"
class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: @birds

    #render json: birds, only: [:id, :name, :species]
    #we can add in the only: option directly after listing an object we want to render to JSON:

    #or
    #render json: birds, except: [:created_at, :updated_at]
    ## equivalent to render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
    # bird = Bird.find_by(id: params[:id])
    # render json: bird
    # No need for instance variables anymore, since we're immediately
    # rendering birds and bird to JSON and are not going to be using ERB.
    # if we want to pick and choose what we want to send
    # render json: {id: bird.id, name: bird.name, species: bird.species }
    # render json: bird.slice(:id, :name, :species)
    # the Hash slice method returns a new hash with only the keys that are
    # passed into slice
  end
end
