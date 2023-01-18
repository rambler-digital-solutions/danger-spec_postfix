# danger-spec_postfix

Danger plugin to validate files (or directories) naming.

## Installation

    $ gem install danger-spec_postfix

## Example of usage

    1. Add lint to your Dangerfile (specifying what you want to check and how)

    For example in order to make sure that all tests in your 'spec/' folder have required postfix '_spec' (this is the purpose plugin was initially built for) add:

    ```
    options = {
      message: 'Tests should have `_spec` postfix',
      scope: %r{spec/},
      match: %r{_spec.rb$}
    }
    spec_postfix.lint(options)
    ```

    You can also pass `exceptions` param in order to skip irrelevant files or directories:

    ```
    options = {
      message: 'Tests should have `_spec` postfix',
      scope: %r{spec/},
      match: %r{_spec.rb$}
      exception: Regexp.union(%r{rails_helper.rb}, %r{rails_helper.rb}, %{spec/factories/}, %r{spec/support/})
    }
    spec_postfix.lint(options)
    ```

    2. Get warnings:

    ```
    "Tests should have `_spec` postfix: spec/models/test_without_postfix.rb"
    ```

## Development

1. Clone this repo
2. Run `bundle install` to setup dependencies.
3. Run `bundle exec rake spec` to run the tests.
4. Use `bundle exec guard` to automatically have tests run as you make changes.
5. Make your changes.
