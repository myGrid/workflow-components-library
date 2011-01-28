require 'versionomy'

module ActiveRecord
  module HasVersionField
    def self.included(mod)
      mod.extend(ClassMethods)
    end
    
    module ClassMethods
      def has_version_field(model_attribute=:version)
        attr_readonly model_attribute
        
        define_method "#{model_attribute.to_s}_bump" do |version_object_part|
          v = Versionomy.parse(self[model_attribute])
          self[model_attribute] = v.bump(version_object_part).to_s
        end 
      end
    end
  end
end

ActiveRecord::Base.send(:include, ActiveRecord::HasVersionField)