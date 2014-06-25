class CorrectAdministrationFieldOnCocktail < ActiveRecord::Migration
  def change
    rename_column :cocktails, :adminstration, :administration
  end
end
