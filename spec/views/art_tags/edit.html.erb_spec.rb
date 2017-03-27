require 'rails_helper'

RSpec.describe "art_tags/edit", type: :view do
  before(:each) do
    @art_tag = assign(:art_tag, ArtTag.create!())
  end

  it "renders the edit art_tag form" do
    render

    assert_select "form[action=?][method=?]", art_tag_path(@art_tag), "post" do
    end
  end
end
