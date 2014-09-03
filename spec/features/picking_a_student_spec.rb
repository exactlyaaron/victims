feature "Picking a student" do
  background do
  
  end

  scenario "available students" do
    Fabricate(:student, name: "Richmond")
    Fabricate(:student, name: "Nathan")
    Fabricate(:student, name: "Jack")
    Fabricate(:student, name: "Rachel")
    visit '/'
    click_on "Pick Student"
    expect(page).to have_content("You called on")
  end

  scenario "one available choice" do
    Fabricate(:student, name: "Richmond", called_on: 1.hour.ago)
    Fabricate(:student, name: "Nathan", called_on: 1.hour.ago)
    Fabricate(:student, name: "Rachel")
    visit '/'
    click_on "Pick Student"
    expect(page).to have_content("You called on Rachel")
  end

  scenario "no available students" do
    Fabricate(:student, name: "Richmond", called_on: 1.hour.ago)
    visit '/'
    expect(Student.count).to eq 1
    click_on "Pick Student"
    expect(page).to have_content("No one left to call on")
  end
end