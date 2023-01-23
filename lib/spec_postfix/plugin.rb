# frozen_string_literal: true

module Danger
  class DangerSpecPostfix < Plugin
    # Lints files (or directories) naming.
    # Generates a `string` with warning.
    #
    # @param   files [Array<String>]
    #          A globbed string which should return the files that you want to lint, defaults to nil.
    #          if nil, modified and added files from the diff will be used.
    # @param   include_path [Regexp] Scope of check
    # @param   match [Regexp] Pattern to match
    # @param   message [String] Warn message
    # @param   exclude_path [Regexp] Not required. In case you want to have some directories or files exceptions.
    # @return  [void]
    #
    def lint(include_path:, match:, message:, exclude_path: nil)
      wrong_files = changed_files.select { |f| f.match?(include_path) }.reject { |f| f.match?(match) }
      wrong_files = wrong_files.reject { |f| f.match?(exclude_path) } if exclude_path
      wrong_files.each { |f| warn("#{message}: #{f}") }
    end

    private

    def changed_files
      (git.modified_files + git.added_files)
    end
  end
end
