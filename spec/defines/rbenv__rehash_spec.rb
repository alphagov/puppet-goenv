require 'spec_helper'

describe 'goenv::rehash' do
  let(:facts) {{
    :osfamily => 'Debian',
  }}

  context 'Version 1.2.2' do
    let(:title) { '1.2.2' }

    it {
      should contain_exec('goenv rehash for 1.2.2').with(
        :command     => '/usr/bin/goenv rehash',
        :environment => [
          'GOENV_ROOT=/usr/lib/goenv',
          'GOENV_VERSION=1.2.2',
        ],
        :refreshonly => true
      )
    }
  end
end
