require 'rails_helper'

RSpec.describe "videos/index", type: :view do
  before(:each) do
    assign(:videos, [
      Video.create!(
        :title => "Title",
        :description => "Description",
        :directors => "Directors",
        :actors => "Actors"
      ),
      Video.create!(
        :title => "Title",
        :description => "Description",
        :directors => "Directors",
        :actors => "Actors"
      )
    ])
  end

  it "renders a list of videos" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Directors".to_s, :count => 2
    assert_select "tr>td", :text => "Actors".to_s, :count => 2
  end
end
