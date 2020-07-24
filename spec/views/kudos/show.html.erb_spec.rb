require 'rails_helper'

RSpec.describe "kudos/show", type: :view do
  before(:each) do
    @kudo = assign(:kudo, Kudo.create!(
      message: "MyText",
      sender_id: 2,
      recipient_id: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
