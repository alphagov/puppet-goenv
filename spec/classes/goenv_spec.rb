require 'spec_helper'

describe 'goenv' do
  let(:facts) {{
    :osfamily => 'Debian',
  }}

  context 'standard resources' do
    it { should contain_package('goenv') }

    it {
      should contain_file('/etc/profile.d/goenv.sh').with(
        :mode    => '0755',
        :content => /GOENV_ROOT="\/usr\/lib\/goenv"/
      )
    }
  end

  context 'global_version uses default from goenv::global' do
    it { should contain_class('goenv::global') }
  end

  context 'global_version is 1.2.3' do
    let(:params) {{
      :global_version => '1.2.3',
    }}

    it { should contain_class('goenv::global') }
  end
end
