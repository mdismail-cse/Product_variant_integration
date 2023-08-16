require "test_helper"

class AtributesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @atribute = atributes(:one)
  end

  test "should get index" do
    get atributes_url
    assert_response :success
  end

  test "should get new" do
    get new_atribute_url
    assert_response :success
  end

  test "should create atribute" do
    assert_difference("Atribute.count") do
      post atributes_url, params: { atribute: { type: @atribute.type } }
    end

    assert_redirected_to atribute_url(Atribute.last)
  end

  test "should show atribute" do
    get atribute_url(@atribute)
    assert_response :success
  end

  test "should get edit" do
    get edit_atribute_url(@atribute)
    assert_response :success
  end

  test "should update atribute" do
    patch atribute_url(@atribute), params: { atribute: { type: @atribute.type } }
    assert_redirected_to atribute_url(@atribute)
  end

  test "should destroy atribute" do
    assert_difference("Atribute.count", -1) do
      delete atribute_url(@atribute)
    end

    assert_redirected_to atributes_url
  end
end
