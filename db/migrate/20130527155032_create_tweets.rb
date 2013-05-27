class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.references :user
      t.text :tweet
      t.string :twitter_id
      t.timestamps
    end
  end
end
