module Atozfunc
  module Generators
    # Some helpers for generating scaffolding
    module GeneratorHelpers
      attr_accessor :options, :attributes

      private

      def model_columns_for_attributes
        class_name.constantize.columns.reject do |column|
          column.name.to_s =~ /^(id|user_id|created_at|updated_at)$/
        end
      end

      def editable_attributes
        attributes ||= model_columns_for_attributes.map do |column|
          Rails::Generators::GeneratedAttribute.new(column.name.to_s, column.type.to_s)
        end
        return attributes.map { |a| a.name.prepend(':') }.join(', ')
      rescue
        {}
      end

      def show_action?
        !options['skip_show']
      end

      def skip_route?
        options['skip_route']
      end

      def with_params?
        options['with_params']
      end

      def controller_class_name
        @controller_class_name = super
        return @controller_class_name
      end

      def split_controller
        controller_class_name.split("::")
      end

      def is_group_controller?
        split_controller.size > 1
      end

      def cutted_last_namespace
        split_controller.size - 2
      end

      def controller_dir
        if is_group_controller?
          dir = split_controller[0..cutted_last_namespace].join("/").downcase
          return dir
        end
      end
    end
  end
end
