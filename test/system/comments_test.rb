# frozen_string_literal: true

require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
    @user = users(:test1)
    @comment = comments(:one)
    login_as @user
  end

  test 'コメント一覧' do
    visit book_path(id: @book.id)
    assert_selector 'h3', text: I18n.t('comments')
  end

  test 'コメント作成' do
    visit book_path(id: @book.id)

    fill_in 'comment_body', with: 'この本はとても面白かったです'
    find('input[type="submit"]').click

    assert_text 'この本はとても面白かったです'
  end

  test 'コメント更新' do
    visit edit_book_comment_path(@book, @comment)

    fill_in 'comment_body', with: 'この本はとてもつまらなかった'
    find('input[type="submit"]').click

    assert_text 'この本はとてもつまらなかった'
  end

  test 'コメント削除' do
    visit book_path(id: @book.id)

    page.accept_confirm do
      click_on I18n.t('destroy'), match: :first
    end

    assert_text I18n.t('Comment was successfully destroyed')
  end
end
