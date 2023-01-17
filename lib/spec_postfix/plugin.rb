# frozen_string_literal: true

module Danger
  # Lints the test files. Will fail if any has no '_spec' postfix.
  # Generates a `string` with warning.
  #
  # @param   [Array<String>] files
  #          A globbed string which should return the files that you want to lint, defaults to nil.
  #          if nil, modified and added files from the diff will be used.
  # @return  [void]
  #
  class DangerSpecPostfix < Plugin
    def lint(exceptions: [])
      changed_files.select { |f| f.match?(%r{^spec/.*rb$}) }
                   .reject { |f| f.end_with?('_spec.rb') }
                   .reject { |f| exceptions.any? { |e| f.start_with?(e) } }
                   .each   { |f| warn(warning_generator(f)) }
    end

    private

    def changed_files
      (git.modified_files + git.added_files)
    end

    def warning_generator(file)
      "Tests should have `_spec` postfix: #{file}"
    end
  end
end
