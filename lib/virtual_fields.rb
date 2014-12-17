require "virtual_fields/version"
include ActiveModel::MassAssignmentSecurity

module VirtualFields
  # Your code goes here...
  require 'virtual_fields/railtie' if defined?(Rails)
  class << self
    def valid_table?(model_name)
      model_name.to_s.camelize.constantize
    end

    def valid_column?(model_name)
      klass = model_name.to_s.camelize.constantize
      klass.attribute_names.include?('content')
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
    base.serialize :content
    base.after_initialize :set_content
  end

  module ClassMethods
    def virtual_keys(*args)
      args.each do |arg|
        attr_accessible %(:#{arg})

        define_method arg do
          self.set_content
          self.content[arg.to_s]
        end

        define_method "#{arg}=" do |new_val|
          self.set_content
          self.content[arg.to_s] = new_val
        end
      end
    end
  end

  def set_content
    self.content ||= {}
  end
end
