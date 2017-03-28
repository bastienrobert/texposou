require 'rails_helper'

RSpec.describe "participations/new", type: :view do
  before(:each) do
    assign(:participation, Participation.new(
      :area => "",
      :user => nil
    ))
  end

  it "renders new participation form" do
    render

    assert_select "form[action=?][method=?]", participations_path, "post" do

      assert_select "input#participation_area[name=?]", "participation[area]"

      assert_select "input#participation_user_id[name=?]", "participation[user_id]"
    end
  end
end
