class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :uuid
      t.string :full_url
      t.string :secret

      t.timestamps
    end

    add_index(:urls, :uuid, unique: true)
  end
end
