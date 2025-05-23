class AddForeignKeys < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :chats, :users, column: :sender_id
    add_foreign_key :chats, :users, column: :receiver_id
    add_foreign_key :messages, :users
    add_foreign_key :messages, :chats
  end
end
