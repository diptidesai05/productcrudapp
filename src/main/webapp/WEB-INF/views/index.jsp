<html>
<head>
<%@include file="./base.jsp"%>
</head>
<body>
 <div class="container mt-3">
     <div class="row">
        <div class="col-md-12">
            <h1 class="text-center mb-3">Welcome to Product App</h1>
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th scope="col">S.No.</th>
							<th scope="col">Product Name</th>
							<th scope="col">Description</th>
							<th scope="col">Price</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
					    <c:forEach items="${productList}" var="prod">
						<tr>
							<th scope="row">${prod.productId}</th>
							<td>${prod.name}</td>
							<td>${prod.description}</td>
							<td class="font-weight-bold">&#x20B9; ${prod.price}</td>
							<td>
							<a href="deleteProduct/${prod.productId}"><i class="fa-solid fa-trash text-danger" style="font-size:20px;"></i></a>
							&#160;
							<a href="updateProduct/${prod.productId}"><i class="fa-solid fa-pen-nib text-primary" style="font-size:20px;"></i></a>
							</td>
						</tr>
					    </c:forEach>
					</tbody>
				</table>
				<div class="container text-center">
				  <a href="addProduct" class="btn btn-outline-success">Add Product</a>
				</div>
			</div>
     </div>
 </div>

</body>
</html>
