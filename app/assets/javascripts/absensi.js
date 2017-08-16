//= require vue.js

var vm = new Vue({
    el: '#form_app',
    data: {
        check_data:[],
        mahasiswa_rel:[],
        absensi_data:[],
        selectedId: 0,
        abs: "1",
    },
    methods:{
        absensing: function(index, event){
            // console.log(index);
            // console.log(event.target.name);
            // console.log(event.target.value);
            this.absensi_data[index]={idnya: event.target.name.substring(5), absen: event.target.value};
            console.log(this.absensi_data);
        }
    }
});
$(document).ready(function() {
    var form_app=$("#form_app");
    var id=$("#kelas_id").val();

    if(form_app!=null){
        refresh_list_mahasiswa()

        $('#btn-save').on('click', function(e) {
            e.preventDefault();

            $.ajax({
                url: "http://localhost:3000/kelas/update_absensi/"+id+".json",
                dataType: 'json',
                type: "POST",
                data: {
                    datas: vm.absensi_data,
                    abs: vm.abs,
                },
                success: function(data) { 
                    refresh_list_mahasiswa();
                    $('#myModal').modal('hide');
                }.bind(this),
                error: function(xhr, status, err) {
                    refresh_list_mahasiswa();
                    $('#myModal').modal('hide');
                }.bind(this)
            });

            return false;
        });

        function refresh_list_mahasiswa(){
            $.getJSON("http://localhost:3000/kelas/mahasiswa_rel/"+id+".json", (response) => { 
                vm.mahasiswa_rel = response;
            });
        }
    }
});