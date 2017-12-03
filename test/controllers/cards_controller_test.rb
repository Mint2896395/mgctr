require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card = cards(:one)
  end

  test "should get index" do
    get cards_url
    assert_response :success
  end

  test "should get new" do
    get new_card_url
    assert_response :success
  end

  test "should create card" do
    assert_difference('Card.count') do
      post cards_url, params: { card: { card01: @card.card01, card02: @card.card02, card03: @card.card03, card04: @card.card04, card05: @card.card05, card06: @card.card06, card07: @card.card07, card08: @card.card08, card09: @card.card09, card10: @card.card10, card11: @card.card11, card12: @card.card12, date: @card.date, diff: @card.diff, name: @card.name, person_id: @card.person_id, price: @card.price } }
    end

    assert_redirected_to card_url(Card.last)
  end

  test "should show card" do
    get card_url(@card)
    assert_response :success
  end

  test "should get edit" do
    get edit_card_url(@card)
    assert_response :success
  end

  test "should update card" do
    patch card_url(@card), params: { card: { card01: @card.card01, card02: @card.card02, card03: @card.card03, card04: @card.card04, card05: @card.card05, card06: @card.card06, card07: @card.card07, card08: @card.card08, card09: @card.card09, card10: @card.card10, card11: @card.card11, card12: @card.card12, date: @card.date, diff: @card.diff, name: @card.name, person_id: @card.person_id, price: @card.price } }
    assert_redirected_to card_url(@card)
  end

  test "should destroy card" do
    assert_difference('Card.count', -1) do
      delete card_url(@card)
    end

    assert_redirected_to cards_url
  end
end
