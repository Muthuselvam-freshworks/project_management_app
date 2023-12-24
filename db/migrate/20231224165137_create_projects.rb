class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.text :description
      t.references :created_user, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
