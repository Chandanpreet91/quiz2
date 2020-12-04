require 'rails_helper'

RSpec.describe IdeasController, type: :controller do
    describe "#new" do 
        it "renders the new template" do 
            #Given

            #When
                get(:new)
            #then
                expect(response).to(render_template(:new))
        end
        it "sets an instance variable with a new job post" do 
                get(:new)

                expect(assigns(:idea)).to(be_a_new(Idea))
        
        end
    end



end