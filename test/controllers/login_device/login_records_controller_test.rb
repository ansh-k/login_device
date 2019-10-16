require 'test_helper'

module LoginDevice
  class LoginRecordsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @login_record = login_device_login_records(:one)
    end

    test "should get index" do
      get login_records_url
      assert_response :success
    end

    test "should get new" do
      get new_login_record_url
      assert_response :success
    end

    test "should create login_record" do
      assert_difference('LoginRecord.count') do
        post login_records_url, params: { login_record: { device: @login_record.device, last_seen: @login_record.last_seen, token: @login_record.token } }
      end

      assert_redirected_to login_record_url(LoginRecord.last)
    end

    test "should show login_record" do
      get login_record_url(@login_record)
      assert_response :success
    end

    test "should get edit" do
      get edit_login_record_url(@login_record)
      assert_response :success
    end

    test "should update login_record" do
      patch login_record_url(@login_record), params: { login_record: { device: @login_record.device, last_seen: @login_record.last_seen, token: @login_record.token } }
      assert_redirected_to login_record_url(@login_record)
    end

    test "should destroy login_record" do
      assert_difference('LoginRecord.count', -1) do
        delete login_record_url(@login_record)
      end

      assert_redirected_to login_records_url
    end
  end
end
