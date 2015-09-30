
# Focus on goenv::global proxy of goenv
describe 'goenv' do
  let(:facts) {{
    :osfamily => 'Debian',
  }}
  let(:file_path) { '/usr/lib/goenv/version' }

  context 'when version is default(undef), remove the file' do
    it {
      is_expected.to contain_file(file_path).with_ensure('absent')
    }
  end

  context 'when version is 1.2.3' do
    let(:params) {{
      :global_version => '1.2.3',
    }}

    it {
      is_expected.to contain_file(file_path).with(
        :content => "1.2.3\n",
        :require => 'Goenv::Version[1.2.3]'
      )
    }
  end
end
