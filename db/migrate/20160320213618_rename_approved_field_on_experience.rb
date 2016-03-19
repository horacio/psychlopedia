class RenameApprovedFieldOnExperience < ActiveRecord::Migration
  def change
    change_table :experiences do |t|
      t.rename :is_approved, :approved
    end
  end
end
