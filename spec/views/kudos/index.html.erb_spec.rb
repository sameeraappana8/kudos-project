require 'rails_helper'

RSpec.describe "kudos/index", type: :view do
  before(:each) do
    assign(:kudos, [
      Kudo.create!(
        message: "MyText",
        sender_id: 2,
        recipient_id: 3
      ),
      Kudo.create!(
        message: "MyText",
        sender_id: 2,
        recipient_id: 3
      )
    ])
  end

  it "renders a list of kudos" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
