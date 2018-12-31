# frozen_string_literal: true

class CocktailsController < ApplicationController
  before_action :set_cocktail, only: %i[show update destroy]

  # GET /cocktails
  def index
    @cocktails = Cocktail.all
    json_response(@cocktails)
  end

  # POST /cocktails
  def create
    @cocktail = Cocktail.create!(cocktail_params)
    json_response(@cocktail, :created)
  end

  # GET /cocktails/:id
  def show
    json_response(@cocktail)
  end

  # PUT /cocktails/:id
  def update
    @cocktail.update(cocktail_params)
    head :no_content
  end

  # DELETE /cocktails/:id
  def destroy
    @cocktail.destroy
    head :no_content
  end

  private

  def cocktail_params
    # whitelist params
    params.permit(:title, :created_by)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
