require 'rails_helper'

RSpec.describe "videos/new", type: :view do
  before(:each) do
    assign(:video, Video.new(
      :title => "MyString",
      :description => "MyString",
      :directors => "MyString",
      :actors => "MyString"
    ))
  end

  it "renders new video form" do
    render

    assert_select "form[action=?][method=?]", videos_path, "post" do

      assert_select "input#video_title[name=?]", "video[title]"

      assert_select "input#video_description[name=?]", "video[description]"

      assert_select "input#video_directors[name=?]", "video[directors]"

      assert_select "input#video_actors[name=?]", "video[actors]"
    end
  end
end
