require 'rails_helper'

RSpec.describe "videos/edit", type: :view do
  before(:each) do
    @video = assign(:video, Video.create!(
      :title => "MyString",
      :description => "MyString",
      :directors => "MyString",
      :actors => "MyString"
    ))
  end

  it "renders the edit video form" do
    render

    assert_select "form[action=?][method=?]", video_path(@video), "post" do

      assert_select "input#video_title[name=?]", "video[title]"

      assert_select "input#video_description[name=?]", "video[description]"

      assert_select "input#video_directors[name=?]", "video[directors]"

      assert_select "input#video_actors[name=?]", "video[actors]"
    end
  end
end
