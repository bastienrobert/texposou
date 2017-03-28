require "rails_helper"

RSpec.describe ParticipationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/participations").to route_to("participations#index")
    end

    it "routes to #new" do
      expect(:get => "/participations/new").to route_to("participations#new")
    end

    it "routes to #show" do
      expect(:get => "/participations/1").to route_to("participations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/participations/1/edit").to route_to("participations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/participations").to route_to("participations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/participations/1").to route_to("participations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/participations/1").to route_to("participations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/participations/1").to route_to("participations#destroy", :id => "1")
    end

  end
end
