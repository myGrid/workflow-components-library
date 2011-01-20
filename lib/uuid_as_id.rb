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
        self.id = UUID.new.generate
      end
    end
  end
end

ActiveRecord::Base.send(:include, ActiveRecord::UUIDAsID)