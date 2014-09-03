require 'rails_helper'

RSpec.describe Student, :type => :model do
  it { should validate_presence_of :name }

  it "can return the first valid choice" do
    student_1 = Fabricate(:student, name: "Richmond")
    Fabricate(:student, name: "Nathan")
    Fabricate(:student, name: "Jack")
    Fabricate(:student, name: "Rachel")
    
    allow_any_instance_of(Array).to receive(:sample) do |array|
      array[0]
    end
    expect(Student.pick_victim).to eq student_1
  end

  it "can return the last valid choice" do
    Fabricate(:student, name: "Nathan")
    Fabricate(:student, name: "Jack")
    student_3 = Fabricate(:student, name: "Rachel")
    Fabricate(:student, name: "Richmond", called_on: 1.hour.ago)

    allow_any_instance_of(Array).to receive(:sample) do |array|
      array.last
    end
    expect(Student.pick_victim).to eq student_3
  end

  it "returns nil if no choice is available" do
    Fabricate(:student, name: "Richmond", called_on: 1.hour.ago)
    Fabricate(:student, name: "Rachel", called_on: 1.hour.ago)
    expect(Student.pick_victim).to be nil
  end
end
