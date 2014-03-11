class RemoveEmailFromReviewers < ActiveRecord::Migration
  def change
    remove_column :reviewers, :email, :string
  end
end
