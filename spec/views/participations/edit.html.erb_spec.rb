require 'rails_helper'

RSpec.describe "participations/edit", type: :view do
  before(:each) do
    @participation = assign(:participation, Participation.create!(
      :area => "",
      :user => nil
    ))
  end

  it "renders the edit participation form" do
    render

    assert_select "form[action=?][method=?]", participation_path(@participation), "post" do

      assert_select "input#participation_area[name=?]", "participation[area]"

      assert_select "input#participation_user_id[name=?]", "participation[user_id]"
    end
  end
end
