class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :author
      t.text :content
      t.string :description
      t.datetime :published_at
      t.string :title
      t.string :url
      t.string :url_to_image
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end

    add_index :articles, :published_at
  end
end
