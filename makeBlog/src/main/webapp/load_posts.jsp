<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<div class="row">

	<%
	/* Thread.sleep(100); */

	PostDao d = new PostDao(ConnectionProvider.getConnection());

	int cid = Integer.parseInt(request.getParameter("cid"));

	/* Category ct = d.getCategoryBycid(cid); */

	List<Post> posts = null;
	if (cid == 0) {
		posts = d.getAllPost();
	} else {
		posts = d.getPostByCatId(cid);
	}

	if (posts.size() == 0) {
		out.println("<h2 class = 'display-3 text-center'>No Post in this category </h2>");
		return;
	}
	for (Post p : posts) {
	%>

	<div class="col-md-6 mt-2 mb-4">
		<div class="card border border-1 shadow-sm p-3 mb-4 "
			style="border-radius: 10px; background: #fff;">

			<img src="blog_pics/<%=p.getpPic()%>" class="card-img-top border border-1 rounded" alt="ggg">
			
			<%
			int ccid = p.getCatId();
			Category ct = d.getCategoryBycid(ccid);
			%>
			<div class="clearfix">
    			<span class="float-start mt-3 text-white" style="padding: 5px 10px; background: #10927c; border-radius: 20px; font-size: 13px;"><%=ct.getName()%></span>
  			</div>
			

			<div class="card-body" style="">
				<b> <%=p.getpTitle()%></b>
				<p class="card-text">
					<%=p.getpContent()%>
				</p>

			</div>

			<div class="card-footer container-fuid ">
				<div class="row justify-content-between">
					<div class="col-4">
						 <!-- URL rewriting -->
						<a href="show_blog_page.jsp?post_id=<%=p.getPid()%>"
							class="btn btn-sm text-white"
							style="background: #10927c; border-radius: 5px">Read More...</a>
					</div>
					<div class="col-4">
						<a href="#!" class="btn btn-sm"><i class="fa fa-thumbs-up"
							style="color: #10927c;"></i> <span> 10</span> </a> <a href="#!"
							class="btn btn-sm"><i class="far fa-comment-dots"
							style="color: #10927c;"></i> <span> 20</span> </a>
					</div>
				</div>
			</div>

		</div>
	</div>

	<%
	}
	%>

</div>