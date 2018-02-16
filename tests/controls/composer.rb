# encoding: utf-8
# copyright: 2017, DeBankeGroup

title 'Composer Command'

control 'composer-commands' do
  impact 1
  title 'Chef-DK'
  desc 'Should respond to the composer command'
  describe command('chef --version') do
    its('exit_status') { should match 0 }
    its('stdout') { should match /Chef Development Kit Version/ }
  end

  describe command('git') do
    its('stdout') { should match /These are common Git commands used in various situations/ }
  end
end
