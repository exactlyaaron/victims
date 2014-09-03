feature "Picking a student" do
  background do
  
  end

  scenario "available students" do
    Fabricate(:student, name: "Richmond")
    # Fabricate(:student, name: "Nathan")
    # Fabricate(:student, name: "Jack")
    # Fabricate(:student, name: "Rachel")
    visit '/'
    expect(Student.count).to eq 1
    click_on "Pick Student"
    expect(page).to have_content("You called on Richmond")
    
  end

  scenario "no available students" do
    Fabricate(:student, name: "Richmond")
    visit '/'
    expect(Student.count).to eq 1
  end
end