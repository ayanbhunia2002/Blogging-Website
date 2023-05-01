function doLike(pid, uid){
	
	console.log(pid + " , " + uid);
	
	const d = {
        uid: uid,
        pid: pid,
        operation: 'like'
    }
	
	console.log(d);
	//ajax
	$.ajax({
		url: "LikeServlet",
		type: 'POST',
		data: d,
		success: function (data, textStatus, jqXHR){
			console.log(data);
			if (data.trim() == 'true')
            {
                let c = $(".like-counter").html();
                c++;
                $('.like-counter').html(c);
            }
            else{
                swal("You have already liked");
			}
		},
		error: function (jqXHR, textStatus, errorThrown) {
            console.log(data);
        }
	})
	
}