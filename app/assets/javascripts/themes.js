
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