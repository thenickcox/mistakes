class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.text :content_html
      t.string :nickname
      t.date :date
      t.boolean :public

      t.timestamps
    end
  end
end
