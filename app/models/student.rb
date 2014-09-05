class Student < ActiveRecord::Base
  
  validates_presence_of :name

  default_scope ->{ order("id ASC") }
  scope :not_called_on_today, ->{ where("called_on <= ? OR called_on IS null", 1.day.ago) }
 
  def called_on_today?
    called_on.nil? || called_on <= 1.day.ago
  end

  def self.pick_victim
    Student.not_called_on_today.order("RANDOM()").first
  end

end
