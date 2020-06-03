# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'test1はtest2をフォローする' do
    assert_not users(:test1).following?(users(:test2))
    users(:test1).follow(users(:test2))
    assert users(:test1).following?(users(:test2))
  end

  test 'test3はtest4のフォローを外す' do
    assert users(:test3).following?(users(:test4))
    users(:test3).unfollow(users(:test4))
    assert_not users(:test3).following?(users(:test4))
  end

  test '登録済みユーザーをOAuth認証情報から発見する' do
    auth = OmniAuth::AuthHash.new(uid: '1', provider: 'github')
    user1 = users(:test1)
    auth_user = User.find_for_github_oauth(auth)
    assert user1 == auth_user
  end

  test 'ダミーのemailを生成' do
    auth = OmniAuth::AuthHash.new(uid: '1', provider: 'github')
    email = User.dummy_email(auth)
    assert email == '1-github@example.com'
  end
end
