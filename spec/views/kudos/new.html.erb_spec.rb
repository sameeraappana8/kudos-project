require 'rails_helper'

RSpec.describe "kudos/new", type: :view do
  before(:each) do
    assign(:kudo, Kudo.new(
      message: "MyText",
      sender_id: 1,
      recipient_id: 1
    ))
  end

  it "renders new kudo form" do
    render

    assert_select "form[action=?][method=?]", kudos_path, "post" do

      assert_select "textarea[name=?]", "kudo[message]"

      assert_select "input[name=?]", "kudo[sender_id]"

      assert_select "input[name=?]", "kudo[recipient_id]"
    end
  end
end
