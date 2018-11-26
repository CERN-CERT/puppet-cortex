require 'spec_helper'

describe 'cortex::service' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('cortex::config') }

      it do
        is_expected.to contain_service('cortex.service').with(
          'enable' => 'true'
        )
      end
    end
  end
end
