class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :uuid
      t.string :full_url
      t.string :secret

      t.timestamps
    end

    add_index(:links, :uuid, unique: true)
  end
end
