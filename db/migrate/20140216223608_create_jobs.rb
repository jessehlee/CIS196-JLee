class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :role
      t.integer :startyear
      t.integer :endyear
      t.belongs_to :reviewer, index: true

      t.timestamps
    end
  end
end
