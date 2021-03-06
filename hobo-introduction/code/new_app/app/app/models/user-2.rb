class User < ActiveRecord::Base
  hobo_user_model # Don't put anything above this

#START:hobofields
  fields do
    username :string, :login => true, :name => true
    administrator :boolean, :default => false
    timestamps
  end
#END:hobofields
  set_admin_on_first_user


  # --- Hobo Permissions --- #
#START:permissions
  def creatable_by?(creator)
    creator.administrator? || !administrator
  end
  def updatable_by?(updater, new)
    updater.administrator? || (updater == self && only_changed_fields?(new, :password, :password_confirmation))
  end
  def deletable_by?(deleter)
    deleter.administrator?
  end
  def viewable_by?(viewer, field)
    true
  end
#END:permissions
end
