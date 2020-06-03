# frozen_string_literal: true

require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:test1)
    login_as @user
  end

  test 'ユーザー一覧' do
    visit users_url
    assert_selector 'h1', text: I18n.t('users')
  end

  test 'ユーザー表示' do
    visit user_path(id: @user.id)
    assert_selector 'h1', text: I18n.t('profile')
  end
end
