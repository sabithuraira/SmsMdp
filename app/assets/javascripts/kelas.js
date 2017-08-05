//= require vue.js

var vm = new Vue({
    el: '#form_app',
    data: {
        datas: [],
        check_data:[],
        mahasiswa_rel:[],
        selectedId: 0,
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

            $.ajax({
                url: "http://localhost:3000/kelas/update_mahasiswa/"+id+".json",
                dataType: 'json',
                type: "POST",
                // headers: {
                //     "X-CSRF-TOKEN": csrf 
                // },
                data: {
                    datas: vm.check_data
                },
                success: function(data) { 
                    $.getJSON("http://localhost:3000/kelas/mahasiswa_rel/"+id+".json", (response) => { 
                        vm.mahasiswa_rel = response;
                    });
                    $('#myModal').modal('hide');
                }.bind(this),
                error: function(xhr, status, err) {
                    $.getJSON("http://localhost:3000/kelas/mahasiswa_rel/"+id+".json", (response) => { 
                        vm.mahasiswa_rel = response;
                    });
                    $('#myModal').modal('hide');
                }.bind(this)
            });

            return false;
        });

        $('body').on('click','.delete-data', function(e) {
            e.preventDefault();
            vm.selectedId = $(this).attr('data-id');
            $('#myModalDelete').modal('show');
        });

        $('body').on('click','#btn-delete', function(e) {
            e.preventDefault();
            delete_data(e)
            $('#myModalDelete').modal('hide');
        });


        function delete_data(event){
            var submit_url="http://localhost:3000/kelas/delete_mahasiswa/"+vm.selectedId+".json";
            var submit_type='DELETE';
            $.ajax({
                url: submit_url,
                dataType: 'json',
                type: submit_type,
                success: function(data) { 
                    vm.selectedId=0;
                    $.getJSON("http://localhost:3000/kelas/mahasiswa_rel/"+id+".json", (response) => { 
                        vm.mahasiswa_rel = response;
                    });
                }.bind(this),
                error: function(xhr, status, err) {
                    console.log(xhr)
                }.bind(this)
            });
        }
    }
});