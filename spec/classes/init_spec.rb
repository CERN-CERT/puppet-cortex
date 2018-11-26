require 'spec_helper'

describe 'cortex' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('cortex::install') }
      it { is_expected.to contain_class('cortex::config') }
      it { is_expected.to contain_class('cortex::service') }
    end
  end
end
