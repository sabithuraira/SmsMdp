$("#form_index").submit(function(){
    alert("i got you");
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
