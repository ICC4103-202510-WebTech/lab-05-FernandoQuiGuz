puts "Creating users..."

users_data = [
  { first_name: "Bluey", last_name: "Heeler", email: "bluey@bluey.com" },
  { first_name: "Bandit", last_name: "Heeler", email: "bandit@bluey.com" },
  { first_name: "Bingo", last_name: "Heeler", email: "bingo@bluey.com" },
  { first_name: "Chilli", last_name: "Heeler", email: "chilli@bluey.com" },
  { first_name: "Grandpa", last_name: "Heeler", email: "grandpa@bluey.com" },
  { first_name: "Uncle", last_name: "Scooter", email: "uncle@bluey.com" },
  { first_name: "Muffin", last_name: "Heeler", email: "muffin@bluey.com" },
  { first_name: "Snickers", last_name: "Poodle", email: "snickers@bluey.com" },
  { first_name: "Jackson", last_name: "Dog", email: "jackson@bluey.com" },
  { first_name: "Calypso", last_name: "Teacher", email: "calypso@bluey.com" }
]

users = users_data.map do |user_data|
  User.find_or_create_by!(email: user_data[:email]) do |user|
    user.first_name = user_data[:first_name]
    user.last_name = user_data[:last_name]
    user.password = "password"
  end
end

puts "Users created successfully!"

puts "Creating chats..."

Chat.create!([
  { sender: users[0], receiver: users[1] },
  { sender: users[1], receiver: users[2] },
  { sender: users[2], receiver: users[3] },
  { sender: users[3], receiver: users[4] },
  { sender: users[4], receiver: users[5] },
  { sender: users[5], receiver: users[6] },
  { sender: users[6], receiver: users[7] },
  { sender: users[7], receiver: users[8] },
  { sender: users[8], receiver: users[9] },
  { sender: users[9], receiver: users[0] }
])

puts "Chats created successfully!"

puts "Creating messages..."

chats = Chat.all

Message.create!([
  { chat: chats[0], user: users[0], body: "Hola Bingo, ¿quieres jugar?" },
  { chat: chats[1], user: users[1], body: "Hola Bandit, ¿cómo estás?" },
  { chat: chats[2], user: users[2], body: "Hola Chilli, ¿qué tal?" },
  { chat: chats[3], user: users[3], body: "Hola Grandpa, ¿cómo va todo?" },
  { chat: chats[4], user: users[4], body: "Uncle Scooter, ¿me puedes ayudar?" },
  { chat: chats[5], user: users[5], body: "Muffin, ¿quieres jugar conmigo?" },
  { chat: chats[6], user: users[6], body: "Snickers, ¿te acuerdas de cuando..." },
  { chat: chats[7], user: users[7], body: "Jackson, ¿cómo te va?" },
  { chat: chats[8], user: users[8], body: "Calypso, ¿qué aprendemos hoy?" },
  { chat: chats[9], user: users[9], body: "Bluey, ¿cómo va la aventura?" }
])

puts "Messages created successfully!"
