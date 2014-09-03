class Student < ActiveRecord::Base
  
  validates_presence_of :name

  default_scope ->{ order("id ASC") }
  scope :not_called_on_today, ->{ where(:called_on => nil) }
 
  def self.pick_victim
    # This assumes the not_called_on_today is a named scope, defined elsewhere in the class
    possible_students = Student.not_called_on_today.all
    possible_students.sample # Gives us a random student from the list
  end

  def check_time
    if self.called_on == nil
      return
    else
      timeago = (Time.now-self.called_on).to_i
      if timeago > 86400
        puts "===================="
        puts self.called_on
        self.update(called_on: nil)
      else
        return
      end
    end
  end

end
