require 'test_helper'

class MahasiswaKelasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mahasiswa_kela = mahasiswa_kelas(:one)
  end

  test "should get index" do
    get mahasiswa_kelas_url
    assert_response :success
  end

  test "should get new" do
    get new_mahasiswa_kela_url
    assert_response :success
  end

  test "should create mahasiswa_kela" do
    assert_difference('MahasiswaKela.count') do
      post mahasiswa_kelas_url, params: { mahasiswa_kela: { created_by: @mahasiswa_kela.created_by, kelas_id: @mahasiswa_kela.kelas_id, mahasiswa_id: @mahasiswa_kela.mahasiswa_id, updated_by: @mahasiswa_kela.updated_by } }
    end

    assert_redirected_to mahasiswa_kela_url(MahasiswaKela.last)
  end

  test "should show mahasiswa_kela" do
    get mahasiswa_kela_url(@mahasiswa_kela)
    assert_response :success
  end

  test "should get edit" do
    get edit_mahasiswa_kela_url(@mahasiswa_kela)
    assert_response :success
  end

  test "should update mahasiswa_kela" do
    patch mahasiswa_kela_url(@mahasiswa_kela), params: { mahasiswa_kela: { created_by: @mahasiswa_kela.created_by, kelas_id: @mahasiswa_kela.kelas_id, mahasiswa_id: @mahasiswa_kela.mahasiswa_id, updated_by: @mahasiswa_kela.updated_by } }
    assert_redirected_to mahasiswa_kela_url(@mahasiswa_kela)
  end

  test "should destroy mahasiswa_kela" do
    assert_difference('MahasiswaKela.count', -1) do
      delete mahasiswa_kela_url(@mahasiswa_kela)
    end

    assert_redirected_to mahasiswa_kelas_url
  end
end
