class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.integer :tournament_id
      t.string :name
      t.integer :player_id
      t.string :score
      t.string :swiss_rank
      t.string :overall_rank
      t.integer :mov
      t.decimal :sos
      t.boolean :dropped
      t.integer :list_points

      t.index :tournament_id
      t.column :list_json, 'jsonb'

      t.timestamps
    end
  end
end
