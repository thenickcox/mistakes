class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.text :content_html
      t.date :date
      t.string :tag_list
      t.boolean :public

      t.timestamps
    end
  end
end
