require 'rails_helper'

RSpec.describe "art_tags/new", type: :view do
  before(:each) do
    assign(:art_tag, ArtTag.new())
  end

  it "renders new art_tag form" do
    render

    assert_select "form[action=?][method=?]", art_tags_path, "post" do
    end
  end
end
