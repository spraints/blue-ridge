require 'rails/generators'

require File.expand_path(File.dirname(__FILE__) + '/../../../blue_ridge')

module BlueRidge
  module Generators
    class ConfigureBlueRidgeGenerator < Rails::Generators::Base
      def self.source_root
        @source_root ||= File.expand_path('../templates', __FILE__)
      end

      def install
        base_dir = BlueRidge.javascript_spec_dir
        copy_file 'application_spec.js', "#{base_dir}/application_spec.js"
        copy_file 'spec_helper.js',      "#{base_dir}/spec_helper.js"
        copy_file 'application.html',    "#{base_dir}/fixtures/application.html"
        copy_file 'screw.css',           "#{base_dir}/fixtures/screw.css"
      end
    end
  end
end
