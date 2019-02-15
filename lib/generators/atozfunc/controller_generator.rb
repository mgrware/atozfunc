require 'generators/atozfunc/generator_helpers'

module Atozfunc
  module Generators
    # Custom scaffolding generator
    class ControllerGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers
      include Atozfunc::Generators::GeneratorHelpers
      source_root File.expand_path('../templates', __FILE__)

      class_option :skip_show, type: :boolean, default: false, desc: "Skip show action"
      class_option :with_params, type: :boolean, default: false, desc: "with method params"
      class_option :skip_route, type: :boolean, default: false, desc: "skip adding routes"

      desc "Generates controller, controller_spec and views for the model with the given NAME."

      def copy_controller_and_spec_files
        template "controller.rb", File.join("app/controllers/#{controller_dir}", "#{controller_file_name}_controller.rb")
      end

      def add_routes
        routes_string = "resources :#{plural_name}"
        routes_string += ', except: :show' unless show_action?
        route routes_string  unless skip_route?
      end
    end
  end
end
