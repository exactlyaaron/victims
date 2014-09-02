feature "Picking a student" do
  background do
    Fabricate(:student, name: "Richmond")
  end

  scenario "Happy Path" do
    visit '/'
    expect(Student.count).to eq 1
  end
end