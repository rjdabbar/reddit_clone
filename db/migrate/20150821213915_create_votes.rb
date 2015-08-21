class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :votable, polymorphic: true, index: true
      t.integer    :value,   null: false
      t.timestamps           null: false
    end
  end
end
