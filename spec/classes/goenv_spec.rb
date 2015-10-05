
describe 'goenv' do
  let(:facts) {{
    :osfamily => 'Debian',
  }}

  context 'standard resources' do
    it { is_expected.to contain_package('goenv') }

    it {
      is_expected.to contain_file('/etc/profile.d/goenv.sh').with(
        :mode    => '0755',
        :content => /GOENV_ROOT="\/usr\/lib\/goenv"/
      )
    }
  end

  context 'global_version uses default from goenv::global' do
    it { is_expected.to contain_class('goenv::global') }
  end

  context 'global_version is 1.2.3' do
    let(:params) {{
      :global_version => '1.2.3',
    }}

    it { is_expected.to contain_class('goenv::global') }
  end
end
