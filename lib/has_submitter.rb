# Originally from the BioCatalogue codebase
 
module ActiveRecord
  module HasSubmitter #:nodoc:
    def self.included(mod)
      mod.extend(ClassMethods)
    end
    
    module ClassMethods
      def has_submitter
        validates :submitter,
                  :presence => true,
                  :existence => true
            
        belongs_to :submitter,
                   :polymorphic => true

        class_eval do
          extend ActiveRecord::HasSubmitter::SingletonMethods
        end
        include ActiveRecord::HasSubmitter::InstanceMethods
      end
    end
    
    module SingletonMethods
      
    end
    
    module InstanceMethods
      def submitter_name
        %w{ preferred_name display_name title name }.each do |w|
          return eval("submitter.#{w}") if submitter.respond_to?(w)
        end
        return "#{submitter.class.name}_#{submitter.id}"
      end 
    end
  end
end

ActiveRecord::Base.send(:include, ActiveRecord::HasSubmitter)