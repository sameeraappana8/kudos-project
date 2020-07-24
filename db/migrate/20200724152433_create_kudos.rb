class CreateKudos < ActiveRecord::Migration[6.0]
  def change
    create_table :kudos do |t|
      t.text :message
      t.integer :sender_id
      t.integer :recipient_id

      t.timestamps
    end
  end
end
