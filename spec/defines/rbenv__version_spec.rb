require 'spec_helper'

describe 'goenv::version' do
  let(:facts) {{
    :osfamily => 'Debian',
    :path     => '/usr/lib/goenv/versions/1.2.2/bin:/usr/lib/goenv/shims:/usr/sbin:/usr/bin:/sbin:/bin',
  }}

  context 'Version 1.2.2' do
    let(:title) { '1.2.2' }

    context 'go version' do
      it {
        should contain_package('goenv-go-1.2.2').with(
          :ensure  => "latest",
          :notify  => "Goenv::Rehash[1.2.2]",
          :require => 'Class[Goenv]'
        )
      }
    end

    context 'rehash' do
      it { should contain_goenv__rehash('1.2.2') }
    end
  end
end
