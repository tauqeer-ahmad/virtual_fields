require "virtual_attributes/version"
include ActiveModel::MassAssignmentSecurity

module VirtualAttributes
  # Your code goes here...

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
