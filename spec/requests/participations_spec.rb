require 'rails_helper'

RSpec.describe "Participations", type: :request do
  describe "GET /participations" do
    it "works! (now write some real specs)" do
      get participations_path
      expect(response).to have_http_status(200)
    end
  end
end
