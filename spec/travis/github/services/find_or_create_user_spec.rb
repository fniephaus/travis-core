require 'spec_helper'

describe Travis::Github::Services::FindOrCreateUser do
  include Support::ActiveRecord

  let(:service) { described_class.new(nil, params) }

  attr_reader :params

  before :each do
  end

  it 'finds an existing user' do
    user = Factory(:user, login: 'foobar', github_id: 999)
    @params = { github_id: user.github_id, login: 'foobar' }
    service.run.should == user
  end

  it 'updates repositories owner_name if login is changed' do
    user = Factory(:user, login: 'foobar', github_id: 999)
    user.repositories << Factory(:repository, owner_name: 'foobar', name: 'foo', owner: user)
    user.repositories << Factory(:repository, owner_name: 'foobar', name: 'bar', owner: user)

    @params = { github_id: user.github_id, login: 'foobarbaz' }
    service.run.should == user

    user.reload.repositories.map(&:owner_name).uniq.should == ['foobarbaz']
  end

  it 'creates a user from github' do
    @params = { github_id: 999 }
    service.stubs(:fetch_data).returns({'name' => 'Foo Bar', 'login' => 'foobar', 'email' => 'foobar@example.org', 'id' => 999})
    expect {
      service.run
    }.to change { User.count }.by(1)

    user = User.first
    user.name.should == 'Foo Bar'
    user.login.should == 'foobar'
    user.email.should == 'foobar@example.org'
    user.github_id.should == 999
  end

  xit 'raises a GithubApi error if the user could not be retrieved' do
  end
end
