package kr.ac.inhatc.mvc.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.inhatc.mvc.dto.MemberDto;
import kr.ac.inhatc.mvc.dto.ProductDto;
import kr.ac.inhatc.mvc.dto.ProductRepository;
import kr.ac.inhatc.mvc.service.ShopService;

@Controller
public class ShopController {
	
	@Autowired
	ShopService service;
	
	ProductRepository pr = new ProductRepository();
	
	@GetMapping("welcome")
	public String welcome(Model model) throws Exception {
		long time = System.currentTimeMillis();
		Date day = new Date(time);
		SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss a", Locale.US);
		String CT = format.format(day);
		model.addAttribute("time", CT);
		return "welcome";
	}
	
	@GetMapping("/login")
	public String getLogin() throws Exception {
		return "login/login";
	}
	
	@PostMapping("/loginPost")
	public ModelAndView loginPost(@RequestParam String id, @RequestParam String passwd, Model model, MemberDto dto, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		dto.setId(id);
		dto.setPasswd(passwd);
		MemberDto Mdto = service.checkLogin(dto);
		if(Mdto.getCnt() > 0) {
			session.setAttribute("member", Mdto);
			mv.addObject("msg", 2);
			mv.setViewName("login/resultMember");
		} else {
			mv.addObject("error",1);
			mv.setViewName("login/login");
		}
		
		return mv;
	}
	
	@GetMapping("/logout")
	public String getLogout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/welcome";
	}
	
	@GetMapping("/register")
	public String getRegister() throws Exception {
		return "login/register";
	}
	
	@PostMapping("/registerPost")
	public ModelAndView registerPost(@RequestParam String id, @RequestParam String passwd, 
			@RequestParam String name, @RequestParam String gender, 
			@RequestParam String birthyy, @RequestParam String birthmm, @RequestParam String birthdd,
			@RequestParam String mail1, @RequestParam String mail2, @RequestParam String phone,
			@RequestParam String address, Model model, MemberDto dto, HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		String birth = birthyy + "/" + birthmm + "/" + birthdd;
		String mail = mail1 + "@" + mail2;
		
		dto.setId(id);
		dto.setPasswd(passwd);
		dto.setGender(gender);
		dto.setBirth(birth);
		dto.setMail(mail);
		dto.setPhone(phone);
		dto.setAddress(address);
		
		int overlapId = service.getOverlapId(dto.getId());
		if(overlapId > 0) {
			mv.addObject("overlapId", true);
			mv.setViewName("register");
			return mv;
		} 
		service.addUser(dto);
		mv.addObject("msg", 1);
		mv.setViewName("login/resultMember");
		return mv;
	}
	
	@GetMapping("/productList")
	public ModelAndView getProductList(Model model) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("listOfProducts", pr.getAllProducts());
		mv.setViewName("product/productList");
		return mv;
	}
	
	@GetMapping("/productDetail")
	public ModelAndView getProductDetail(Model model, @RequestParam("productId") String productId) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("product", pr.getProductById(productId));
		mv.setViewName("product/productDetail");
		return mv;
	}
	
	@GetMapping("/addProduct")
	public ModelAndView getAddProduct(Model model) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("product/addProduct");
		return mv;
	}
	
	@PostMapping("/addProductPost")
	public ModelAndView addProductPost(Model model, ProductDto dto,
			@RequestParam String productId, @RequestParam String name, @RequestParam int unitPrice,
			@RequestParam String description, @RequestParam String manufacturer, @RequestParam String category,
			@RequestParam int unitsInStock, @RequestParam String condition, @RequestParam MultipartFile productImage) throws Exception {
		//request.setCharacterEncoding("UTF-8");
		//파일명
		String originalFile = productImage.getOriginalFilename();
		//파일명 중 확장자만 추출
		String originalFileExtension = originalFile.substring(originalFile.lastIndexOf("."));
		//업무에서 사용하는 리눅스, UNIX는 한글지원이 안 되는 운영체제 
        //파일업로드시 파일명은 ASCII코드로 저장되므로, 한글명으로 저장 필요
        //UUID클래스 - (특수문자를 포함한)문자를 랜덤으로 생성
		//"-"라면 생략으로 대체
		String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
		
		String realFolder = "C:\\Users\\tgus7\\OneDrive\\문서\\Spring Workspace\\hello__spring\\src\\main\\webapp\\res\\img\\"; //웹 애플리케이션상의 절대 경로
		
		File file = new File(realFolder + storedFileName);
		productImage.transferTo(file);	

		ProductDto newProduct = new ProductDto();
		
		newProduct.setProductId(productId);
		newProduct.setPname(name);
		newProduct.setUnitPrice(unitPrice);
		newProduct.setDescription(description);
		newProduct.setManufacturer(manufacturer);
		newProduct.setCategory(category);
		newProduct.setUnitsInStock(unitsInStock);
		newProduct.setCondition(condition);
		newProduct.setFilename(storedFileName);
	
		pr.addProduct(newProduct);
		return getProductList(model);
	}
	
	@GetMapping("/adminProduct")
	public ModelAndView getAdminProduct(Model model) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("listOfProducts", pr.getAllProducts());
		mv.setViewName("product/adminProduct");
		return mv;
	}
	
	@GetMapping("/editProduct")
	public ModelAndView getEditProduct(Model model, @RequestParam("productId") String productId) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("product", pr.getProductById(productId));
		mv.setViewName("product/editProduct");
		return mv;
	}
	
	@PostMapping("/editProductPost")
	public ModelAndView editProductPost(Model model, ProductDto dto,
			@RequestParam String productId, @RequestParam String name, @RequestParam int unitPrice,
			@RequestParam String description, @RequestParam String manufacturer, @RequestParam String category,
			@RequestParam int unitsInStock, @RequestParam String condition, @RequestParam MultipartFile productImage) throws Exception {
		
		String originalFile = productImage.getOriginalFilename();
		String originalFileExtension = originalFile.substring(originalFile.lastIndexOf("."));
		String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
		
		String realFolder = "C:\\Users\\tgus7\\OneDrive\\문서\\Spring Workspace\\hello__spring\\src\\main\\webapp\\res\\img\\";
		
		File file = new File(realFolder + storedFileName);
		productImage.transferTo(file);
		ProductDto product =  pr.getProductById(productId);
		product.setPname(name);
		product.setUnitPrice(unitPrice);
		product.setDescription(description);
		product.setManufacturer(manufacturer);
		product.setCategory(category);
		product.setUnitsInStock(unitsInStock);
		product.setCondition(condition);
		product.setFilename(storedFileName);

		return getProductList(model);
	}
	
	@GetMapping("/deleteProduct")
	public ModelAndView deleteProduct(Model model, @RequestParam("productId") String productId) throws Exception {
		pr.deleteProduct(productId);
		return getProductList(model);
	}
}
