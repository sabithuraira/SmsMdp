//= require vue.js

var vm = new Vue({
    el: '#form_app',
    data: {
        check_data:[],
        mahasiswa_rel:[],
        absensi_data:[],
        selectedId: 0,
        // tanggal: "",
        materi: "",
        keterangan: "",
        is_uas:0,
    },
    methods:{
        absensing: function(index, event){
            this.absensi_data[index]={idnya: event.target.name.substring(5), absen: event.target.value};
            // console.log(this.absensi_data);
        }
    }
});
$(document).ready(function() {
    var form_app=$("#form_app");
    var id=$("#kelas_id").val();


    $('#tanggal').datepicker({
        forceParse: false
    });

    if(form_app!=null){
        refresh_list_mahasiswa()

        $('#btn-save').on('click', function(e) {
            e.preventDefault();
            // console.log($("#tanggal").val());
            if(validation){
                $.ajax({
                    url: "http://localhost:3000/kelas/update_absensi/"+id+".json",
                    dataType: 'json',
                    type: "POST",
                    data: {
                        abs: $("#abs").val(),
                        tanggal: $("#tanggal").val(),
                        materi: vm.materi,
                        keterangan: vm.keterangan,
                        datas: JSON.stringify(vm.absensi_data),
                        is_uas: vm.is_uas,
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
            if(vm.absensi_data.length<vm.mahasiswa_rel)
                return false;

            if(vm.abs.length==0 ||  vm.materi.length==0)
                return false;

            return true;
        }
    }
});