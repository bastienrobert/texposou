require 'test_helper'

class ExhibitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exhibition = exhibitions(:one)
  end

  test "should get index" do
    get exhibitions_url
    assert_response :success
  end

  test "should get new" do
    get new_exhibition_url
    assert_response :success
  end

  test "should create exhibition" do
    assert_difference('Exhibition.count') do
      post exhibitions_url, params: { exhibition: { area_left: @exhibition.area_left, area_max: @exhibition.area_max, artists_max: @exhibition.artists_max, closing_at: @exhibition.closing_at, description: @exhibition.description, name: @exhibition.name, opening_at: @exhibition.opening_at, price_per_day_per_area: @exhibition.price_per_day_per_area } }
    end

    assert_redirected_to exhibition_url(Exhibition.last)
  end

  test "should show exhibition" do
    get exhibition_url(@exhibition)
    assert_response :success
  end

  test "should get edit" do
    get edit_exhibition_url(@exhibition)
    assert_response :success
  end

  test "should update exhibition" do
    patch exhibition_url(@exhibition), params: { exhibition: { area_left: @exhibition.area_left, area_max: @exhibition.area_max, artists_max: @exhibition.artists_max, closing_at: @exhibition.closing_at, description: @exhibition.description, name: @exhibition.name, opening_at: @exhibition.opening_at, price_per_day_per_area: @exhibition.price_per_day_per_area } }
    assert_redirected_to exhibition_url(@exhibition)
  end

  test "should destroy exhibition" do
    assert_difference('Exhibition.count', -1) do
      delete exhibition_url(@exhibition)
    end

    assert_redirected_to exhibitions_url
  end
end
