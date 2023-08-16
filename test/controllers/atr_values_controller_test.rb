require "test_helper"

class AtrValuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @atr_value = atr_values(:one)
  end

  test "should get index" do
    get atr_values_url
    assert_response :success
  end

  test "should get new" do
    get new_atr_value_url
    assert_response :success
  end

  test "should create atr_value" do
    assert_difference("AtrValue.count") do
      post atr_values_url, params: { atr_value: { atribute_id: @atr_value.atribute_id, value: @atr_value.value } }
    end

    assert_redirected_to atr_value_url(AtrValue.last)
  end

  test "should show atr_value" do
    get atr_value_url(@atr_value)
    assert_response :success
  end

  test "should get edit" do
    get edit_atr_value_url(@atr_value)
    assert_response :success
  end

  test "should update atr_value" do
    patch atr_value_url(@atr_value), params: { atr_value: { atribute_id: @atr_value.atribute_id, value: @atr_value.value } }
    assert_redirected_to atr_value_url(@atr_value)
  end

  test "should destroy atr_value" do
    assert_difference("AtrValue.count", -1) do
      delete atr_value_url(@atr_value)
    end

    assert_redirected_to atr_values_url
  end
end
