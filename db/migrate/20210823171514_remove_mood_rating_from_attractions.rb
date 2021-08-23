class RemoveMoodRatingFromAttractions < ActiveRecord::Migration[5.2]
  def change
    remove_column :attractions, :mood_rating, :integer
  end
end
