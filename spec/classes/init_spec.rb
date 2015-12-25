require 'spec_helper'
describe 'emacs_orgmode_protocol' do

  context 'with defaults for all parameters' do
    it { should contain_class('emacs_orgmode_protocol') }
  end
end
