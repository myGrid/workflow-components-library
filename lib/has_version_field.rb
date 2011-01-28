require 'versionomy'

module ActiveRecord
  module HasVersionField
    def self.included(mod)
      mod.extend(ClassMethods)
    end
    
    module ClassMethods
      def has_version_field(model_attribute=:version)
        attr_readonly model_attribute
        
        bump_method_name = "#{model_attribute.to_s}_bump"
        
        # This allows the attribute to only be manually set if it is a new record.
        # Otherwise an error is raised.
        define_method "#{model_attribute.to_s}=" do |new_model_attribute_value|
          if new_record?
            write_attribute(model_attribute, new_model_attribute_value)
          else
            raise "Cannot directly set the ##{model_attribute.to_s} field for the #{self.class.name} model. 
                  Use ##{bump_method_name} instead to work with the field in a more structured way."
          end
        end
        
        define_method bump_method_name do |version_object_part|
          v = Versionomy.parse(self[model_attribute])
          write_attribute(model_attribute, v.bump(version_object_part).to_s)
        end
      end
    end
  end
end

ActiveRecord::Base.send(:include, ActiveRecord::HasVersionField)