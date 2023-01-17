# frozen_string_literal: true

require File.expand_path('spec_helper', __dir__)

module Danger
  describe Danger::DangerSpecPostfix do
    it 'is a plugin' do
      expect(described_class.new(nil)).to be_a Danger::Plugin
    end

    describe 'with Dangerfile' do
      let(:file_path) { nil }

      before do
        @spec_postfix = testing_dangerfile.spec_postfix

        allow(@spec_postfix.git).to receive(:added_files).and_return([])
        allow(@spec_postfix.git).to receive(:modified_files).and_return([file_path])
      end

      subject do
        @spec_postfix.lint
        @spec_postfix.status_report[:warnings]
      end

      context 'with _spec' do
        let(:file_path) { 'spec/models/my_test_spec.rb' }

        it { is_expected.to be_empty }
      end

      context 'with no _spec' do
        let(:file_path) { 'spec/models/my_test.rb' }

        it { is_expected.to eq(["Tests should have `_spec` postfix: #{file_path}"]) }
      end

      context 'when is irrelevant (exceptions)' do
        subject do
          @spec_postfix.lint(exceptions: ['not_tests/'])
          @spec_postfix.status_report[:warnings]
        end

        let(:file_path) { 'not_tests/factory.rb' }

        it { is_expected.to be_empty }
      end
    end
  end
end
