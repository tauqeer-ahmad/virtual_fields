require 'virtual_attributes'
require 'rails'

module VirtualAttributes
  class Railtie < Rails::Railtie
    railtie_name :virtual_attributes

    rake_tasks do
      load "tasks/virtual_attributes.rake"
    end
  end
end
