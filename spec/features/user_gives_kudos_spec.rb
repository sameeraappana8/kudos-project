require "rails_helper"

RSpec.describe "Giving Kudos" do
    let(:ben) { FactoryBot.create(:user) }
    let(:glen) { FactoryBot.create(:user) }
    #let(:message) {FactoryBot.create(:message)}

    scenario "Successfully give kudos" do
        sign_in ben
        visit user_path(glen)
        click_on "Give Kudos"
        expect(page).to have_selector("form")
        expect(page).to have_field(:kudo_message)
        fill_in :kudo_message , with: "random message"
        click_on "Create Kudo"


        expect(page).to have_selector "h4"
    end

    scenario "Unsuccessful" do
        sign_in ben
        visit user_path(glen)
        click_on "Give Kudos"
        expect(page).to have_selector("form")
        expect(page).to have_field(:kudo_message)
        fill_in :kudo_message , with: ""
        click_on "Create Kudo"

        expect(page).to have_content "error"
    end
end