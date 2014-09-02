feature "Adding a student" do
  scenario "Happy Path" do
    visit '/'
    fill_in "Name", with: "Billy"
    click_on "Create Student"
    expect(current_path).to eq students_path
    expect(page).to have_content("The student, Billy has been created.")
    within("ul#students") do
      page.should have_content("Billy")
    end
  end

  scenario "skipping filling out the form" do
    visit '/'
    click_on "Create Student"
    expect(page).to have_content("Student could not be created.")
    expect(page).to have_error("can't be blank", on: "Name")
  end
end