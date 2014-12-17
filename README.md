# VirtualAttributes

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'virtual_fields'

And then execute:

    $ bundle

    $ rake add_virtual_fields model=Model

    example: $ rake add_virtual_fields model=User

Or install it yourself as:

    $ gem install virtual_fields

## Usage

In your model add following code

  include VirtualFields
  virtual_keys :field1, field2, .......


  class User < ActiveRecord::Base
    attr_accessible :email, :name

    include VirtualFields
    virtual_keys :address, :job_title, date_of_birth
  end

  user = User.create
  user.address
  => nil

  user.address = "xyz block"
  user.save

  user.reload
  user.address
  => "xyz block"

That it! Enjoy

## Contributing

1. Fork it ( https://github.com/[my-github-username]/virtual_attributes/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
