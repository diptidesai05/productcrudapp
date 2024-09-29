package productcrudapp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import productcrudapp.dao.ProductDao;
import productcrudapp.model.Product;

//http://localhost:9494/productcrudapp/
@Controller
public class MainController {
	
	@Autowired
	ProductDao productDao;
	
	@RequestMapping("/")
	public String home(Model m) {
		System.out.println("in productDao - home method");
		List<Product> productList = productDao.getProducts();
		m.addAttribute("productList", productList);
		return "index";
	}

    // Show Add Product Form	
	@RequestMapping("/addProduct")
	public  String addProduct(Model m) {
		
		m.addAttribute("title", "Add Product");
		return "addProductForm";
	}
	
	//Process Add Form
	@RequestMapping(value="/processProduct", method=RequestMethod.POST)
	public RedirectView processProduct(@ModelAttribute Product product, HttpServletRequest request) {
		System.out.println(product);
		productDao.createProduct(product);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath()+"/");
		return redirectView;
		
	}
	
	//Delete Product
	@RequestMapping("/deleteProduct/{productId}")
	public RedirectView deleteProduct(@PathVariable("productId") int productId, HttpServletRequest request) {
		System.out.println("product id "+productId);
		productDao.deleteProduct(productId);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath()+"/");
		return redirectView;
		
	}
	
	//Update Product
	@RequestMapping("/updateProduct/{productId}")
	public String updateProductForm(@PathVariable("productId") int productId, Model m) {
		
		Product product = productDao.getProduct(productId);
		System.out.println(product);
		m.addAttribute("product", product);
		m.addAttribute("title", "Update Product");
		return "updateProductForm";
		
	}
}
