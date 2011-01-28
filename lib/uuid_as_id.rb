module ActiveRecord
  module UUIDAsID #:nodoc:
    def self.included(mod)
      mod.extend(ClassMethods)
    end
    
    module ClassMethods
      def uuid_as_id
        set_primary_key :uuid
        attr_readonly :id
        before_validation :set_uuid
      
        validates :uuid,
                  :presence => true,
                  :length => { :maximum => 36 }
        
        # This allows the 'uuid' attribute to only be set if it is a new record.
        # Otherwise an error is raised.
        define_method "uuid=" do |new_uuid|
          if new_record?
            write_attribute(:uuid, new_uuid)
          else
            raise "Cannot directly set the 'uuid' field for the #{self.class.name} model"
          end
        end
        
        class_eval do
          extend ActiveRecord::UUIDAsID::SingletonMethods
        end
        include ActiveRecord::UUIDAsID::InstanceMethods
      end
    end
    
    module SingletonMethods
      
    end
    
    module InstanceMethods
      private
      
      def set_uuid
        self.id = UUID.new.generate if self.id.blank?
      end
    end
  end
end

ActiveRecord::Base.send(:include, ActiveRecord::UUIDAsID)