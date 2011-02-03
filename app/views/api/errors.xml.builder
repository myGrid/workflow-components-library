# <?xml>
xml.instruct! :xml

# <errors>
xml.tag! "errors", 
         :resourceType => "Errors" do
  
  # <error> *
  
  if defined? @errors and !@errors.nil?
    @errors.each do | error |
      xml.error error
    end
  end
  
end