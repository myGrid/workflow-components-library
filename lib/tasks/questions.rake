namespace :wcl do
  namespace :questions do
    desc "Loads up a default set of questions to use"
    task :load => :environment do
      
      Question.transaction do
        Question.all.each do |q|
          q.destroy
        end
        
        questions = {
          "1" => "Did you source this component from somewhere? (eg: an existing workflow, etc; link(s) would be very handy!)",
          "2" => "When shown in the Taverna workbench, what group(s) could this component come under? (eg: 'util', 'file/types/spreadsheets', 'file/input')  (comma separated)",
          "3" => "What tags would you use to describe this?  (comma separated)",
          "4" => "What domains/fields does this apply to?  (comma separated)",
          "5" => "What images/icons could best depict this component? (description or links appreciated!)",
          "6" => "What existing Taverna 1 or 2 workflows are there that show this component in use?",
          "7" => "What external resources/docs could be used to help users of this component? (links to these resources would be great!) ",
          "8" => "Could this component belong to a 'family' of components that all work together? If so, what family?",
          "9" => "Is this component related to any other ones in the library? (links appreciated!)",
          "10" => "Are there any helper components that can be used in conjunction with this components (eg: for data parsing, analysis, and so on)",
          "11" => "Any other notes/info/data?",
          "12" => "Describe configuration fields that users of this component would see"
        }
        
        questions.each do |k,v|
          q = Question.new
          q.id = k
          q.value = v
          q.save!
        end
      end
         
    end
  end
end