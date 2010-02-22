require 'rails/generators'

require File.expand_path(File.dirname(__FILE__) + '/../../blue_ridge')

class BlueRidgeGenerator < Rails::Generators::Base
  def self.source_root
    @source_root ||= File.expand_path('../templates', __FILE__)
  end

  def install
    base_dir = BlueRidge.javascript_spec_dir
    template 'application_spec.js', "#{base_dir}/application_spec.js"
    template 'spec_helper.js',      "#{base_dir}/spec_helper.js"
    template 'application.html',    "#{base_dir}/fixtures/application.html"
    template 'screw.css',           "#{base_dir}/fixtures/screw.css"
  end
end
