// import { Kelas } from "./kelas";

// console.log("masuk");
// // var Subapp = {
// //   c_kelas: function(){ Kelas.run(); }
// // };
// $( document ).ready(function() {
//     console.log( "ready!" );
// });

$("#form_index").submit(function(){
    var search_str=$('#table_search').val();
    $.ajax({
        type: "POST",
        url: $(this).attr('action'),
        data: "search="+search_str,
        success: function(data){
            $('#table_data').html(data)
        }
    });
    return false;
});