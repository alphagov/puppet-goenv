require 'spec_helper'

describe 'goenv::version' do
  let(:facts) {{
    :osfamily => 'Debian',
    :path     => '/usr/lib/goenv/versions/1.2.2/bin:/usr/lib/goenv/shims:/usr/sbin:/usr/bin:/sbin:/bin',
  }}

  context 'Version 1.2.2' do
    let(:title) { '1.2.2' }

    it {
      should contain_exec('install-goenv-go-1.2.2').with(
        :command => "/usr/bin/goenv install 1.2.2",
        :environment => "GOENV_ROOT=/usr/lib/goenv",
        :creates => "/usr/lib/goenv/versions/1.2.2/bin/go",
        :require => 'Class[Goenv]'
      )
    }
  end
end
