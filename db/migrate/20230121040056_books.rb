class Books < ActiveRecord::Migration[6.1]
  def up
    add_column :books, :title, :text
    add_column :books, :body, :text
  end
  
  def down
    remove_column :books, :book_title, :string
    remove_column :books, :book_comment, :text
  end
end
