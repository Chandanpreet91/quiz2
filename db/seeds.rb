# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




Idea.delete_all
NUM_OF_IDEAS = 50

NUM_OF_IDEAS.times do 
    created_at = Faker::Date.backward(days:365*5)
         Idea.create(
            title: Faker::Company.catch_phrase,
            description: Faker::Lorem.paragraph, 
            created_at:created_at,
            updated_at:created_at,
        )
      
end


ideas = Idea.all

puts Cowsay.say("Generated #{ideas.count} ideas", :bunny)
