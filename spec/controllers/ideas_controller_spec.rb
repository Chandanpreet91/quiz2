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
    describe "#create" do 
        context "with valid parameters" do 
            def valid_request
                post(:create,params: {idea:FactoryBot.attributes_for(:idea)}) 
            end
            it "creates a idea in the db" do 
                count_before = Idea.count 
                valid_request
                count_after = Idea.count
                expect(count_after).to(eq(count_before + 1))
            end
            it "redirects us to show page for that idea" do 
                valid_request
                idea = Idea.last 
                expect(response).to(redirect_to(idea_url(idea.id)))
            end
        end
        context "with invalid parameters" do 
            def invalid_request 
                post(:create,params: {idea:FactoryBot.attributes_for(:idea,title: nil)})
            end
            it "doesn't save a idea in the db" do 
                count_before = Idea.count 
                invalid_request
                count_after = Idea.count 
                expect(count_after).to eq(count_before)
            end 
            it "renders the new template" do 
                invalid_request
                expect(response).to render_template(:new)
            end
            it "assigns an invalid job_post as an instance variable" do 
                invalid_request
                expect(assigns(:idea)).to be_a(Idea)
                expect(assigns(:idea).valid?).to be(false)
            end
        end
    end


end