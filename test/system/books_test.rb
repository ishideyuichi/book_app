# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
    @user = users(:test1)
    login_as @user
  end

  test '書籍一覧' do
    visit books_url
    assert_selector 'h1', text: I18n.t('books')
  end

  test '書籍表示' do
    visit book_path(id: @book.id)
    assert_selector 'h2', text: I18n.t('book show')
  end

  test '書籍作成' do
    visit new_book_path

    fill_in 'book_memo', with: 'テスト機能の実装'
    fill_in 'book_title', with: '難しい'
    find('input[type="submit"]').click

    assert_text I18n.t('Book was successfully created')
  end

  test '書籍更新' do
    visit edit_book_path(id: @book.id)

    fill_in 'book_memo', with: '画像アップロード'
    fill_in 'book_title', with: '簡単'
    find('input[type="submit"]').click

    assert_text I18n.t('Book was successfully updated')
  end

  test '書籍削除' do
    visit books_path
    page.accept_confirm do
      click_on I18n.t('destroy'), match: :first
    end

    assert_text I18n.t('Book was successfully destroyed')
  end
end
