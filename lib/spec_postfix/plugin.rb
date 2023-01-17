# frozen_string_literal: true

module Danger
  # Lints the test files. Will fail if any has no '_spec' postfix.
  # Generates a `string` with warning.
  #
  # @param   [Array<String>] files
  #          A globbed string which should return the files that you want to lint, defaults to nil.
  #          if nil, modified and added files from the diff will be used.
  # @param   scope [Regexp] Scope of check
  # @param   match [Regexp] Pattern to match
  # @param   message [String] Warn message
  # @param   exception [Regexp] Not required. In case you get some directories or files out of scope.
  # @return  [void]
  #
  class DangerSpecPostfix < Plugin
    def lint(scope:, match:, message:, exception: nil)
      wrong_files = changed_files.select { |f| f.match?(scope) }.reject { |f| f.match?(match) }
      wrong_files = wrong_files.reject { |f| f.match?(exception) } if exception
      wrong_files.each { |f| warn("#{message}: #{f}") }
    end

    private

    def changed_files
      (git.modified_files + git.added_files)
    end
  end
end
