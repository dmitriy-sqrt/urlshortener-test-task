class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.belongs_to :url
      t.string :referrer
      t.string :user_agent
      t.string :ip

      t.timestamps
    end
  end
end
