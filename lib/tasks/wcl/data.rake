namespace :wcl do
  namespace :data do
    
    desc "Loads up a default set of questions to use"
    task :fix_nil_mappings => :environment do
      
      ActiveRecord::Base.record_timestamps = false
      
      ActiveRecord::Base.transaction do
        Port.all.each do |p| 
          p.send(:ensure_mapping); p.save! 
        end
        
        ConfigField.all.each do |c| 
          c.send(:ensure_mapping); c.save! 
        end
      end

      ActiveRecord::Base.record_timestamps = true
    end
    
  end
end





  
