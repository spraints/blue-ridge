require 'rails/generators'

require File.expand_path(File.dirname(__FILE__) + '/../../../blue_ridge')

module BlueRidge
  module Generators
    class JavascriptSpecGenerator < Rails::Generators::NamedBase
      def self.source_root
        @source_root ||= File.expand_path('../templates', __FILE__)
      end

      def generate
        base_dir = BlueRidge.javascript_spec_dir
        
        template 'javascript_spec.js.erb', "#{base_dir}/#{file_path_with_spec}.js"
        template 'fixture.html.erb', "#{base_dir}/fixtures/#{file_path_without_spec}.html"
      end

      private
      def file_path_with_spec
        file_path_with_and_without_spec[0]
      end

      def file_path_without_spec
        file_path_with_and_without_spec[1]
      end
        
      def file_path_with_and_without_spec
        if (file_path =~ /_spec$/i)
          [file_path, file_path.gsub(/_spec$/, "")]
        else
          [file_path + "_spec", file_path]
        end
      end
      
      def class_name_without_spec
        (class_name =~ /Spec$/) ? class_name.gsub(/Spec$/, "") : class_name
      end
    end
  end
end
