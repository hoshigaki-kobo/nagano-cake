require "test_helper"

class Pcblic::GenresControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get pcblic_genres_show_url
    assert_response :success
  end
end
