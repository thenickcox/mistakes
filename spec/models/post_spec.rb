require 'spec_helper'

describe Post do

  let(:nickname) { nil }
  let(:attrs) { {
    content: 'Content',
    title: 'Title',
    nickname: nickname,
  } }

  context 'honeypot not filled' do
    it 'should create a valid post with minimal attrs' do
      expect { Post.create!(attrs) }.not_to raise_error
    end
  end

  context 'honeypot is filled' do
    let(:nickname) { 'Pee-Wee' }
    it 'should not create a post if there is a nickname (honeypot)' do
      expect { Post.create!(attrs) }.to raise_error
    end
  end


end
