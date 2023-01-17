# danger-readme_docs

Danger plugin to validate sub README mention in main README file

## Installation

    $ gem install danger-spec_postfix

## Usage

    Add this to your Dangerfile:

    spec_postfix.lint

## Configuration

    By default some of files and folders are out of scope. You can configure your own custom list of exceptions.

    #config/initializers/danger/danger_spec_postfix.rb

    Danger::DangerSpecPostfix.configure do |config|
      config.exceptions = ['rails_helper.rb', 'rails_helper.rb']
    end

## Development

1. Clone this repo
2. Run `bundle install` to setup dependencies.
3. Run `bundle exec rake spec` to run the tests.
4. Use `bundle exec guard` to automatically have tests run as you make changes.
5. Make your changes.
