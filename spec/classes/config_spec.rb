require 'spec_helper'

describe 'cortex::config' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('cortex::install') }

      it do
        is_expected.to contain_file('/etc/cortex').with(
          'ensure' => 'directory',
          'owner' => 'cortex',
          'group' => 'cortex',
          'mode' => '0550'
        )
      end

      it do
        is_expected.to contain_file('/etc/cortex/application.conf').with(
          'ensure' => 'file',
          'owner' => 'cortex',
          'group' => 'cortex',
          'mode' => '0440'
        )
      end

      it do
        is_expected.to contain_vcsrepo('/opt/cortex/analyzers').with(
          'ensure' => 'present',
          'provider' => 'git',
          'source' => 'https://github.com/TheHive-Project/Cortex-Analyzers.git',
          'revision' => '1.14.4',
          'owner' => 'cortex',
          'group' => 'cortex'
        )
      end
    end
  end
end
