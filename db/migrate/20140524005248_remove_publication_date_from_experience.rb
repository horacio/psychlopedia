class RemovePublicationDateFromExperience < ActiveRecord::Migration
  def change
    remove_column :experiences, :publication_date
  end
end
