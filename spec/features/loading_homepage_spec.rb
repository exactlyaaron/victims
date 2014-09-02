feature "New Homepage view" do
  scenario "is displayed when loading the site" do
    visit '/'
    expect(page).to have_content("Pick a Victim")
  end
end