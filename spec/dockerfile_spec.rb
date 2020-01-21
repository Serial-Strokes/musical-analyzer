require 'serverspec'

describe 'Musical Analyzer Dockerfile' do

  before(:all) do
    set :os, family: :debian
    set :backend, :docker
    set :docker_container, $ma_container.id
  end

  it 'should have installed the right python version' do
    expected_python_version = '3.8.1'
    
    expect(python_version).to include(expected_python_version)
    expect(python_version'3').to include(expected_python_version)
  end

  it 'should have installed the right pip version' do
    expected_pip_version = '19.3.1'
    
    expect(pip_version).to include(expected_pip_version)
    expect(pip_version'3').to include(expected_pip_version)
  end

  it 'should have installed the required python packages' do
    expected_pip_check = 'No broken requirements found.'
    expected_librosa_version = '0.7.1'

    expect(pip_check).to include(expected_pip_check)
    expect(pip_check'3').to include(expected_pip_check)
    expect(package('librosa')).to be_installed.by('pip').with_version(expected_librosa_version)
  end

  def python_version(version = '')
    command("python#{version} --version").stdout
  end

  def pip_version(version = '')
    command("pip#{version} --version").stdout
  end

  def pip_check(version = '')
    command("pip#{version} check").stdout
  end

 end