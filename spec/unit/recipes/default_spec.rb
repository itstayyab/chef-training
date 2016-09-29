#
# Cookbook Name:: tomcat
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'chefspec'

describe 'tomcat::default' do

  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new
    runner.converge(described_recipe)
  end

  context 'Installing package' do
    it 'Open JDK should be installed' do
      expect(chef_run).to install_package('openjdk-7-jre')
    end
  end

    it 'checks the group' do
      expect(chef_run).to create_group('tomcat')
    end

    it 'check the user' do
      expect(chef_run).to create_user('tomcat')
    end

    it 'check the tomcat package' do
      expect(chef_run).to install_package('tomcat7')
    end

    it 'check chef service ' do
      expect(chef_run).to start_service('tomcat7')
      expect(chef_run).to enable_service('tomcat7')
    end

    it 'check tomcat template' do
      expect(chef_run).to create_template('/etc/tomcat7/tomcat-users.xml').with( source: 'tomcat-users.xml.erb')
    end

#    it 'check file created' do
#      expect(chef_run).to create_directory('/tmp/test/').with( recursive: true, owner: 'tomcat', group: 'tomcat')
#    end
#
#    it ''
#  it 'converges successfully' do
#    expect { chef_run }.to_not raise_error
#  end

end
