# danger-spec_postfix

Danger plugin to validate files (or directories) naming.

## Installation

    $ gem install danger-spec_postfix

## Example of usage

    Add to your Dangerfile:

    options = {
      message: 'Tests should have `_spec` postfix',
      scope: %r{spec/},
      match: %r{_spec.rb$}
    }
    spec_postfix.lint(options)

    You can also pass `exceptions` param in order to skip irrelevant files or directories:

    options = {
      message: 'Tests should have `_spec` postfix',
      scope: %r{spec/},
      match: %r{_spec.rb$}
      exception: Regexp.union(%r{rails_helper.rb}, %r{rails_helper.rb}, %{spec/factories/}, %r{spec/support/})
    }
    spec_postfix.lint(options)

## Development

1. Clone this repo
2. Run `bundle install` to setup dependencies.
3. Run `bundle exec rake spec` to run the tests.
4. Use `bundle exec guard` to automatically have tests run as you make changes.
5. Make your changes.
