class Meeting < ActiveRecord::Base
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
    user.administrator?
  end
  def updatable_by?(user, new)
    user.administrator?
  end
  def deletable_by?(user)
    user.administrator?
  end
  def viewable_by?(user, field)
    true
  end
end
