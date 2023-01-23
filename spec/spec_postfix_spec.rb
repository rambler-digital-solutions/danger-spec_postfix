# frozen_string_literal: true

require File.expand_path('spec_helper', __dir__)

module Danger
  describe Danger::DangerSpecPostfix do
    it 'is a plugin' do
      expect(described_class.new(nil)).to be_a Danger::Plugin
    end

    describe 'with Dangerfile' do
      subject do
        @spec_postfix.lint(options)
        @spec_postfix.status_report[:warnings]
      end

      let(:message) { 'Tests should have `_spec` postfix' }
      let(:include_path) { %r{spec/} }
      let(:match) { %r{_spec.rb$} }
      let(:options) do
        {
          message: message,
          include_path: include_path,
          match: match
        }
      end

      before do
        @spec_postfix = testing_dangerfile.spec_postfix

        allow(@spec_postfix.git).to receive(:added_files).and_return([])
        allow(@spec_postfix.git).to receive(:modified_files).and_return([file_path])
      end

      context 'when match' do
        let(:file_path) { 'spec/some_test_spec.rb' }

        it { is_expected.to be_empty }
      end

      context 'when not match' do
        let(:file_path) { 'spec/some_test.rb' }

        it { is_expected.to eq(["#{message}: #{file_path}"]) }

        context 'with exception' do
          let(:options) do
            {
              message: message,
              include_path: include_path,
              match: match,
              exclude_path: exclude_path
            }
          end
          let(:file_path) { 'spec/spec_helper.rb' }
          let(:exclude_path) { Regexp.union(%r{spec/factories}, %r{spec_helper.rb}) }

          it { is_expected.to be_empty }
        end
      end
    end
  end
end
