require 'rails_helper'

describe Review do
  it { should belong_to(:product) }
  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:author)}
  it { should validate_length_of(:content_body).is_at_least(50)}
  it { should validate_length_of(:content_body).is_at_most(250)}
  it { should validate_inclusion_of(:rating).in_range(1..5)}
end