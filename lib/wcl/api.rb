# Originally taken from the BioCatalogue codebase

# FIXME: currently this assumes that routes map directly to model names...

module Wcl
  module Api
  
    def self.uri_for_path(path, *args)
      options = args.extract_options!
      # defaults:
      options.reverse_merge!(:params => nil)        
      
      uri = ""
      
      unless path.blank?
        uri = URI.join(Settings.site.base_url, path).to_s
        uri = append_params(uri, options[:params]) unless options[:params].blank?
      end
      
      return uri
    end
    
    def self.uri_for_collection(resource_name, *args)
      options = args.extract_options!
      # defaults:
      options.reverse_merge!(:params => nil)        
      
      uri = ""
      
      unless resource_name.blank?
        uri = URI.join(Settings.site.base_url, resource_name).to_s
        uri = append_params(uri, options[:params]) unless options[:params].blank?
      end
      
      return uri
    end
    
    def self.uri_for_object(resource_obj, *args)
      options = args.extract_options!
      # defaults:
      options.reverse_merge!(:params => nil,
                             :sub_path => nil)
                             
      uri = ""
      
      unless resource_obj.nil?
        resource_part = "#{resource_obj.class.name.pluralize.underscore}/#{resource_obj.id}"
        unless options[:sub_path].blank?
          sub_path = options[:sub_path]
          sub_path = "/#{sub_path}" unless sub_path.starts_with?('/')
          resource_part += sub_path
        end
        uri = URI.join(Settings.site.base_url, resource_part).to_s
        uri = append_params(uri, options[:params]) unless options[:params].blank?
      end
      
      return uri
    end
    
    # Attempts to figure out what internal object the URI is referring to.
    # Returns nil if the URI is an invalid resource URI, or if the object doesn't exist anymore.
    def self.object_for_uri(uri)
      return nil if uri.blank?
      return nil unless uri.downcase.include?(Settings.site.base_url.downcase)
      
      obj = nil
      
      begin
        pieces = uri.downcase.gsub(Settings.site.base_url.downcase, '').split('/').delete_if { |s| s.blank? }
        obj = pieces[0].singularize.camelize.constantize.find(pieces[1])
      rescue Exception => ex
        Wcl::Util.log_exception(ex, :warning, "Wcl::Api.object_for_uri failed to find an object for the uri '#{uri}'")
      end
      
      return obj
    end
  
  protected
      
    def self.append_params(uri, params)
      # Remove the special params
      new_params = Wcl::Util.remove_rails_special_params_from(params)
      return (new_params.blank? ? uri : "#{uri}?#{new_params.to_query}")
    end
      
  end
end