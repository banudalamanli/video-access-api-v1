require 'rails_helper'

RSpec.describe "videos/show", type: :view do
  before(:each) do
    @video = assign(:video, Video.create!(
      :title => "Title",
      :description => "Description",
      :directors => "Directors",
      :actors => "Actors"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Directors/)
    expect(rendered).to match(/Actors/)
  end
end
