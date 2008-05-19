#START:user_meeting
class Meeting < ActiveRecord::Base
#END:user_meeting
  hobo_model # Don't put anything above this

  fields do
    title :string
    body :textile
    date :datetime
    timestamps
  end

#START:user_meeting

  belongs_to :user, :creator => true

#END:user_meeting

  def creatable_by?(user)
    user == self.user
  end
  def updatable_by?(user, new)
    user == self.user
  end
  def deletable_by?(user)
    user == self.user
  end
  def viewable_by?(user, field)
    true
  end
#START:user_meeting
end
#END:user_meeting
