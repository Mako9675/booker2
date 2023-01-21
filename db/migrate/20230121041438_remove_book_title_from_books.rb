class RemoveBookTitleFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :book_title, :string
    remove_column :books, :book_comment, :text
  end
end
