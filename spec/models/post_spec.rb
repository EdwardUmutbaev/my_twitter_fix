require 'spec_helper'

describe Post do
  it { should belong_to(:user) }

  it { should validate_presence_of :user_id }
  it { should validate_presence_of :message }
  
  it { should ensure_length_of :message }
end
