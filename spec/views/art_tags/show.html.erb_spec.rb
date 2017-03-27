require 'rails_helper'

RSpec.describe "art_tags/show", type: :view do
  before(:each) do
    @art_tag = assign(:art_tag, ArtTag.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
