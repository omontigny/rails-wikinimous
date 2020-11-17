class UpdateColumnNameToArticles < ActiveRecord::Migration[6.0]
  def change
    rename_column :articles, :name, :title
  end
end
