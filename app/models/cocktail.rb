# frozen_string_literal: true

class Cocktail < ApplicationRecord
  validates_presence_of :title, :created_by
  end
