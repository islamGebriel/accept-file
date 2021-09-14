class CreatePortableExecutables < ActiveRecord::Migration[6.1]
  def change
    create_table :portable_executables do |t|
      t.string :name
      t.string :description
      t.string :version
      t.integer :upload_count

      t.timestamps
    end
  end
end
