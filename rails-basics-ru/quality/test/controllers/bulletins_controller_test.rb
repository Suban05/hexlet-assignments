class BulletinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bulletin = bulletins(:one)
  end

  test "gets list of bulletins" do
    get bulletins_path
    assert_response :success
  end

  test "gets a bulletin" do
    get bulletin_path @bulletin
    assert_response :success
  end
end