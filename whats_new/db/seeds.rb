# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


users_data= [
  { first_name: "Bluey", last_name: "Heeler", email: ""},
  { first_name: "Bluey", last_name: "Heeler", email: ""}
]
users_data.each do |user_data|
  User.find_or_create_by!(email: user_data[:email]) do |user|
    user.first_name = user_data[:first_name]
    user.last_name = user_data[:last_name]
    user.password = "password"
  end
end
# User.find_or_create_by!(email: "mail@example.com") do |user|
#   user.first_name = "First"
#   user.last_name = "Last"
#   user.password = "password"
# end

puts "Creating users..."
# find_or_create_by! is used to ensure that the records are created only if they do not already exist.
User.create!([
  { first_name: "Bluey", last_name: "Heeler", email: "bluey@bluey.com" , password: "123456", password_confirmation: "123456" },
  { first_name: "Bingo", last_name: "Heeler", email: "bingo@bluey.com" , password: "123456", password_confirmation: "123456"},
  { first_name: "Bandit", last_name: "Heeler", email: "bandit@bluey.com" , password: "123456", password_confirmation: "123456"},
  { first_name: "Chilli", last_name: "Heeler", email: "chilli@bluey.com" , password: "123456", password_confirmation: "123456"},
  { first_name: "Grandpa", last_name: "Heeler", email: "grandpa@bluey.com" , password: "123456", password_confirmation: "123456"},
  { first_name: "Uncle", last_name: "Scooter", email: "unclescooter@bluey.com" , password: "123456", password_confirmation: "123456"},
  { first_name: "Muffin", last_name: "Heeler", email: "muffin@bluey.com" , password: "123456", password_confirmation: "123456"},
  { first_name: "Snickers", last_name: "Poodle", email: "snickers@bluey.com" , password: "123456", password_confirmation: "123456"},
  { first_name: "Jackson", last_name: "Dog", email: "jackson@bluey.com" , password: "123456", password_confirmation: "123456"},
  { first_name: "Calypso", last_name: "Teacher", email: "calypso@bluey.com" , password: "123456", password_confirmation: "123456"}
])
puts "Users created successfully!"
Chat.create!([
  { sender: User.find(1), receiver_id: 2 },
  { sender_id: 2, receiver_id: 3 },
  { sender_id: 3, receiver_id: 4 },
  { sender_id: 4, receiver_id: 5 },
  { sender_id: 5, receiver_id: 6 },
  { sender_id: 6, receiver_id: 7 },
  { sender_id: 7, receiver_id: 8 },
  { sender_id: 8, receiver_id: 9 },
  { sender_id: 9, receiver_id: 10 },
  { sender_id: 10, receiver_id: 1 }
])

Message.create!([
  { chat_id: 1, user_id: 1, body: "Hola Bingo, ¿quieres jugar?" },
  { chat_id: 2, user_id: 2, body: "Hola Bandit, ¿cómo estás?" },
  { chat_id: 3, user_id: 3, body: "Hola Chilli, ¿qué tal?" },
  { chat_id: 4, user_id: 4, body: "Hola Grandpa, ¿cómo va todo?" },
  { chat_id: 5, user_id: 5, body: "Uncle Scooter, ¿me puedes ayudar?" },
  { chat_id: 6, user_id: 6, body: "Muffin, ¿quieres jugar conmigo?" },
  { chat_id: 7, user_id: 7, body: "Snickers, ¿te acuerdas de cuando..." },
  { chat_id: 8, user_id: 8, body: "Jackson, ¿cómo te va?" },
  { chat_id: 9, user_id: 9, body: "Calypso, ¿qué aprendemos hoy?" },
  { chat_id: 10, user_id: 10, body: "Bluey, ¿cómo va la aventura?" }
])

