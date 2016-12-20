require 'test_helper'

class PreparatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @preparat = preparats(:one)
  end

  test "should get index" do
    get preparats_url
    assert_response :success
  end

  test "should get new" do
    get new_preparat_url
    assert_response :success
  end

  test "should create preparat" do
    assert_difference('Preparat.count') do
      post preparats_url, params: { preparat: { cost: @preparat.cost, dateofmanufacturer: @preparat.dateofmanufacturer, description: @preparat.description, manufacturer_id: @preparat.manufacturer_id, name: @preparat.name, provider_id: @preparat.provider_id, shelflife: @preparat.shelflife, type_id: @preparat.type_id } }
    end

    assert_redirected_to preparat_url(Preparat.last)
  end

  test "should show preparat" do
    get preparat_url(@preparat)
    assert_response :success
  end

  test "should get edit" do
    get edit_preparat_url(@preparat)
    assert_response :success
  end

  test "should update preparat" do
    patch preparat_url(@preparat), params: { preparat: { cost: @preparat.cost, dateofmanufacturer: @preparat.dateofmanufacturer, description: @preparat.description, manufacturer_id: @preparat.manufacturer_id, name: @preparat.name, provider_id: @preparat.provider_id, shelflife: @preparat.shelflife, type_id: @preparat.type_id } }
    assert_redirected_to preparat_url(@preparat)
  end

  test "should destroy preparat" do
    assert_difference('Preparat.count', -1) do
      delete preparat_url(@preparat)
    end

    assert_redirected_to preparats_url
  end
end
