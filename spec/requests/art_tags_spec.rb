require 'rails_helper'

RSpec.describe "ArtTags", type: :request do
  describe "GET /art_tags" do
    it "works! (now write some real specs)" do
      get art_tags_path
      expect(response).to have_http_status(200)
    end
  end
end
