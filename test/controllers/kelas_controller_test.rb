require 'test_helper'

class KelasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kela = kelas(:one)
  end

  test "should get index" do
    get kelas_url
    assert_response :success
  end

  test "should get new" do
    get new_kela_url
    assert_response :success
  end

  test "should create kela" do
    assert_difference('Kela.count') do
      post kelas_url, params: { kela: { created_by: @kela.created_by, dosen_id: @kela.dosen_id, mata_pelajaran_id: @kela.mata_pelajaran_id, nama: @kela.nama, tahun_ajaran: @kela.tahun_ajaran, updated_by: @kela.updated_by } }
    end

    assert_redirected_to kela_url(Kela.last)
  end

  test "should show kela" do
    get kela_url(@kela)
    assert_response :success
  end

  test "should get edit" do
    get edit_kela_url(@kela)
    assert_response :success
  end

  test "should update kela" do
    patch kela_url(@kela), params: { kela: { created_by: @kela.created_by, dosen_id: @kela.dosen_id, mata_pelajaran_id: @kela.mata_pelajaran_id, nama: @kela.nama, tahun_ajaran: @kela.tahun_ajaran, updated_by: @kela.updated_by } }
    assert_redirected_to kela_url(@kela)
  end

  test "should destroy kela" do
    assert_difference('Kela.count', -1) do
      delete kela_url(@kela)
    end

    assert_redirected_to kelas_url
  end
end
