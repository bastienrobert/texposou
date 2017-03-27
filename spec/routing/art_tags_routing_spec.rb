require "rails_helper"

RSpec.describe ArtTagsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/art_tags").to route_to("art_tags#index")
    end

    it "routes to #new" do
      expect(:get => "/art_tags/new").to route_to("art_tags#new")
    end

    it "routes to #show" do
      expect(:get => "/art_tags/1").to route_to("art_tags#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/art_tags/1/edit").to route_to("art_tags#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/art_tags").to route_to("art_tags#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/art_tags/1").to route_to("art_tags#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/art_tags/1").to route_to("art_tags#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/art_tags/1").to route_to("art_tags#destroy", :id => "1")
    end

  end
end
