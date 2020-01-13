require 'serverspec'

describe 'Python unit tests' do

  before(:all) do
    set :os, family: :debian
    set :backend, :docker
    set :docker_container, $ma_container.id
  end

  it 'should pass' do
    execution = pytest_execute
    puts execution.stdout
    puts execution.stderr
    expect(execution.exit_status).to eq(0)
  end

  def pytest_execute()
    command("pytest -rA")
  end

 end