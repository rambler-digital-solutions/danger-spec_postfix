# danger-readme_docs

Danger plugin to validate sub README mention in main README file

## Installation

    $ gem install danger-spec_postfix

## Usage

    Add this to your Dangerfile:

    spec_postfix.lint

    You can also pass `exceptions` param in order to skip irrelevant files or directories:

    spec_postfix.lint(exceptions: ['rails_helper.rb', 'rails_helper.rb', 'spec/factories/', 'spec/support/'])

## Development

1. Clone this repo
2. Run `bundle install` to setup dependencies.
3. Run `bundle exec rake spec` to run the tests.
4. Use `bundle exec guard` to automatically have tests run as you make changes.
5. Make your changes.
