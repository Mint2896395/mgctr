require 'test_helper'

class CardlibrariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cardlibrary = cardlibraries(:one)
  end

  test "should get index" do
    get cardlibraries_url
    assert_response :success
  end

  test "should get new" do
    get new_cardlibrary_url
    assert_response :success
  end

  test "should create cardlibrary" do
    assert_difference('Cardlibrary.count') do
      post cardlibraries_url, params: { cardlibrary: { cardid: @cardlibrary.cardid, cardno: @cardlibrary.cardno, description: @cardlibrary.description, library_id: @cardlibrary.library_id, name: @cardlibrary.name, value: @cardlibrary.value } }
    end

    assert_redirected_to cardlibrary_url(Cardlibrary.last)
  end

  test "should show cardlibrary" do
    get cardlibrary_url(@cardlibrary)
    assert_response :success
  end

  test "should get edit" do
    get edit_cardlibrary_url(@cardlibrary)
    assert_response :success
  end

  test "should update cardlibrary" do
    patch cardlibrary_url(@cardlibrary), params: { cardlibrary: { cardid: @cardlibrary.cardid, cardno: @cardlibrary.cardno, description: @cardlibrary.description, library_id: @cardlibrary.library_id, name: @cardlibrary.name, value: @cardlibrary.value } }
    assert_redirected_to cardlibrary_url(@cardlibrary)
  end

  test "should destroy cardlibrary" do
    assert_difference('Cardlibrary.count', -1) do
      delete cardlibrary_url(@cardlibrary)
    end

    assert_redirected_to cardlibraries_url
  end
end
