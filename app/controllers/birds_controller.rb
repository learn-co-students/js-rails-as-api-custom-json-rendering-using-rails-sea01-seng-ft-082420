class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
    # OR render json: birds, except: [:created_at, :updated_at]
    # WHICH IS LIKE SAYING render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: {id: bird.id, name: bird.name, species: bird.species } 
      # OR render json: bird.slice(:id, :name, :species)
    else 
      render json: { message: 'Bird not found' }
    end
  end
end