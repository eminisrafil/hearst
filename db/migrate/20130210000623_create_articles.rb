class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
    	t.string :address
    	t.integer :positive
    	t.integer :negative
      t.timestamps
    end
  end
end
