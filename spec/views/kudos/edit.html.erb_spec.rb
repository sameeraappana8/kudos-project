require 'rails_helper'

RSpec.describe "kudos/edit", type: :view do
  before(:each) do
    @kudo = assign(:kudo, Kudo.create!(
      message: "MyText",
      sender_id: 1,
      recipient_id: 1
    ))
  end

  it "renders the edit kudo form" do
    render

    assert_select "form[action=?][method=?]", kudo_path(@kudo), "post" do

      assert_select "textarea[name=?]", "kudo[message]"

      assert_select "input[name=?]", "kudo[sender_id]"

      assert_select "input[name=?]", "kudo[recipient_id]"
    end
  end
end
