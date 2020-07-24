require "rails_helper"

RSpec.feature "User visits homepage" do
    scenario "successfully and sees his profile" do
        visit root_path
        expect(page). to have_content "Kudos Project"
    end
end
