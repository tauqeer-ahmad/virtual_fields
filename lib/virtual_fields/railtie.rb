require 'virtual_fields'
require 'rails'

module VirtualFields
  class Railtie < Rails::Railtie
    railtie_name :virtual_fields

    rake_tasks do
      load "tasks/virtual_fields.rake"
    end
  end
end
