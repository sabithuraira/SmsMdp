//= require vue.js

var vm = new Vue({
    el: '#form_app',
    data: {
        check_data:[],
        mahasiswa_rel:[],
        nilai_data:[],
        keterangan: "",
        nilai:"tugas",
    },
    methods:{
        penilaian: function(index, event){
            this.nilai_data[index]={idnya: event.target.name.substring(5), absen: event.target.value};
            // console.log(this.absensi_data);
        }
    }
});
$(document).ready(function() {
    var form_app=$("#form_app");
    var id=$("#kelas_id").val();


    $('#tanggal').datepicker({
        format: "yyyy-mm-dd"
        // forceParse: false
    });

    if(form_app!=null){
        refresh_list_mahasiswa()

        $('#btn-save').on('click', function(e) {
            e.preventDefault();
            // console.log($("#is_uas:checked").val() ? 1 : 0);
            
            if(validation()){
                $.ajax({
                    url: "http://localhost:3000/kelas/update_nilai/"+id+".json",
                    dataType: 'json',
                    type: "POST",
                    data: {
                        tanggal: $("#tanggal").val(),
                        keterangan: vm.keterangan,
                        nilai: vm.nilai,
                        datas: JSON.stringify(vm.nilai_data),
                    },
                    success: function(data) { 
                        window.location.replace("http://localhost:3000/kelas/"+id);
                    }.bind(this),
                    error: function(xhr, status, err) {
                        if(xhr.statusText=="OK")
                            window.location.replace("http://localhost:3000/kelas/"+id);
                        else
                            alert("Terjadi kesalahan, silahkan refresh halaman!");
                    }.bind(this)
                });
            }
            else{
                alert("Mohon lengkapi form!")
            }

            return false;
        });

        function refresh_list_mahasiswa(){
            $.getJSON("http://localhost:3000/kelas/mahasiswa_rel/"+id+".json", (response) => { 
                vm.mahasiswa_rel = response;
            });
        }

        function validation(){
            if(vm.nilai_data.length<vm.mahasiswa_rel)
                return false;

            if(vm.keterangan.length==0)
                return false;

            return true;
        }
    }
});