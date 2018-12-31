# frozen_string_literal: true

class CreateCocktails < ActiveRecord::Migration[5.2]
  def change
    create_table :cocktails do |t|
      t.string :title
      t.string :created_by

      t.timestamps
    end
  end
end
