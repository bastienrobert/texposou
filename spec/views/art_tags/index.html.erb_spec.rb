require 'rails_helper'

RSpec.describe "art_tags/index", type: :view do
  before(:each) do
    assign(:art_tags, [
      ArtTag.create!(),
      ArtTag.create!()
    ])
  end

  it "renders a list of art_tags" do
    render
  end
end
