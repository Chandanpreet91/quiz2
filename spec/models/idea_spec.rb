require 'rails_helper'

RSpec.describe Idea, type: :model do
  describe "validation" do 
      describe "title" do 
         it "requires a title" do 
         #Given
        #  idea = Idea.new
          idea = FactoryBot.build(:idea,title: nil)
         #When 
         idea.valid?
         #then
          expect(idea.errors.messages).to(have_key(:title))
         end
         it "title is unique" do 
         # persited_idea = Idea.create(title: "intro to testing",description: "Added some description")
         #idea = Idea.new(title: "intro to testing") 
          persited_idea = FactoryBot.create(:idea)
          idea = FactoryBot.build(:idea, title: persited_idea.title)

         idea.valid?

         expect(idea.errors.messages).to(have_key(:title))
         end
      end
      describe "description" do 
         it "requires a description" do 
         #Given
          # idea = Idea.new
          idea = FactoryBot.build(:idea,description: nil)
         #When 
          idea.valid?
          #then
          expect(idea.errors.messages).to(have_key(:description))
          end
      end
  end
  

end
