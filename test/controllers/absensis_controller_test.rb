require 'test_helper'

class AbsensisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @absensi = absensis(:one)
  end

  test "should get index" do
    get absensis_url
    assert_response :success
  end

  test "should get new" do
    get new_absensi_url
    assert_response :success
  end

  test "should create absensi" do
    assert_difference('Absensi.count') do
      post absensis_url, params: { absensi: { created_by: @absensi.created_by, flag: @absensi.flag, kelas_id: @absensi.kelas_id, keterangan: @absensi.keterangan, mahasiswa_id: @absensi.mahasiswa_id, pertemuan_ke: @absensi.pertemuan_ke, updated_by: @absensi.updated_by } }
    end

    assert_redirected_to absensi_url(Absensi.last)
  end

  test "should show absensi" do
    get absensi_url(@absensi)
    assert_response :success
  end

  test "should get edit" do
    get edit_absensi_url(@absensi)
    assert_response :success
  end

  test "should update absensi" do
    patch absensi_url(@absensi), params: { absensi: { created_by: @absensi.created_by, flag: @absensi.flag, kelas_id: @absensi.kelas_id, keterangan: @absensi.keterangan, mahasiswa_id: @absensi.mahasiswa_id, pertemuan_ke: @absensi.pertemuan_ke, updated_by: @absensi.updated_by } }
    assert_redirected_to absensi_url(@absensi)
  end

  test "should destroy absensi" do
    assert_difference('Absensi.count', -1) do
      delete absensi_url(@absensi)
    end

    assert_redirected_to absensis_url
  end
end
