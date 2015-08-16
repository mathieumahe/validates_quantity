# ValidatesQuantity

Add to Rails the possibility to validate the quantity of an associate model

## Installation

Add this line to your application's Gemfile:

    gem 'validates_quantity'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install validates_quantity

## Usage

Call `validates_quantity_of` in an ActiveRecord class and pass the name of the association to validate.



    class Topic < ActiveRecord::Base
        validates_quantity_of :tags, :less_than_or_equal_to => 5
    end

Available keys are :

Keys                                      | Operation 
--------------------------------------|----------------
greater_than                         | >
greater_than_or_equal_to    | >=
equal_to                                | ==
less_than                              | <
less_than_or_equal_to         | <=
other_than                            | !=


## Contributing

1. Fork it ( https://github.com/mathieumahe/validates_quantity/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
