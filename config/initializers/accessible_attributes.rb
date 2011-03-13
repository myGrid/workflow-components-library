# IMPORTANT: this ensures that no attributes are mass-assignable 
# unless explicitly specified by a 'attr_accessible' configuration in the Model
class ActiveRecord::Base
  attr_accessible
  attr_accessor :accessible

  private

  def mass_assignment_authorizer
    if accessible == :all
      self.class.protected_attributes
    else
      super + (accessible || [])
    end
  end
end

 ActiveRecord::Base.send(:attr_accessible, :session_id)