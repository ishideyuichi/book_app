# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:one)
    @user = users(:test1)
    login_as @user
  end

  test '一覧表示' do
    user = users(:test1)
    login_as user

    visit reports_url
    assert_selector 'h1', text: I18n.t('reports')
  end

  test '日報表示' do
    visit report_path(id: @report.id)
    assert_selector 'h2', text: I18n.t('report show')
  end

  test '日報作成' do
    visit new_report_path

    fill_in 'report_body', with: 'テスト機能の実装'
    fill_in 'report_title', with: '難しい'
    find('input[type="submit"]').click

    assert_text I18n.t('Report was successfully created')
  end

  test '日報更新' do
    visit edit_report_path(id: @report.id)

    fill_in 'report_body', with: '画像アップロード'
    fill_in 'report_title', with: '簡単'
    find('input[type="submit"]').click

    assert_text I18n.t('Report was successfully updated')
  end

  test '日報削除' do
    visit reports_path
    page.accept_confirm do
      click_on I18n.t('destroy'), match: :first
    end

    assert_text I18n.t('Report was successfully destroyed')
  end
end
