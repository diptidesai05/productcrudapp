<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="./base.jsp"%>
</head>
<body>
<div class="container mt-3">
  <div class="row">
     <div class="col-md-6 offset-md-3">
       <h1 class="text-center mb-3">Update Product Details</h1>
       <form action="${pageContext.request.contextPath}/processProduct" method="post">
         <input type="hidden" value="${product.productId}" name="productId">
          <div class="form-group">
           <label for="productName">Product Name</label>
           <input type="text" class="form-control" id="name" aria-describedby="emailHelp" name="name" placeholder="Enter Product name here" value="${product.name}">
          </div>
          <div class="form-group">
           <label for="productDescription">Product Description</label>
           <textarea row="5" class="form-control" id="description" aria-describedby="emailHelp" name="description" placeholder="Enter Product description here">${product.description}</textarea>
          </div>
          <div class="form-group">
           <label for="productPrice">Product Price</label>
           <input type="text" class="form-control" id="price" aria-describedby="emailHelp" name="price" placeholder="Enter Product price here" value="${product.price}">
          </div>
          <div class="container text-center">
           <a href="${pageContext.request.contextPath}/" class="btn btn-outline-danger">Back</a>
           <button type="sumit" class="btn btn-outline-warning">Update</button>
          </div>
       </form>
       
     </div>
  </div>
</div>
</body>
</html>