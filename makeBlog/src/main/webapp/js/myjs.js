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
			//console.log(data);
			if (data.trim() == 'true')
            {
	
				//var fff = sessionStorage.getItem('ff');

				//console.log(fff);
				
                let c = $(".like-counter").html();
                //if(fff.equals('bc')){
					c++;
				//}
				//else{
				//	if(c > 0){
				//		c--;
				//	}
				//}
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