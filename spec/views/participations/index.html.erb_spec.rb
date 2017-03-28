require 'rails_helper'

RSpec.describe "participations/index", type: :view do
  before(:each) do
    assign(:participations, [
      Participation.create!(
        :area => "",
        :user => nil
      ),
      Participation.create!(
        :area => "",
        :user => nil
      )
    ])
  end

  it "renders a list of participations" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
