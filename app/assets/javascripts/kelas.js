//= require vue.js
var vm = new Vue({
    el: '#form_app',
    data: {
        datas: [],
        check_data:[],
        mahasiswa_rel:[],
    }
});
$(document).ready(function() {
    var form_app=$("#form_app");
    var id=$("#kelas_id").val();

    if(form_app!=null){

        $.getJSON("http://localhost:3000/kelas/subsetmahasiswa/"+id+".json", (response) => { 
            vm.datas = response;
        });


        $.getJSON("http://localhost:3000/kelas/mahasiswa_rel/"+id+".json", (response) => { 
            vm.mahasiswa_rel = response;
        });

        $('#save-btn').on('click', function(e) {
            e.preventDefault();

            // vm.selectedId = $(this).attr('data-id');
            // $('#myModal').modal('show');
        });
    }
});