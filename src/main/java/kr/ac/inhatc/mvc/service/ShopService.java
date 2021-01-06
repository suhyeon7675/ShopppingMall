package kr.ac.inhatc.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.inhatc.mvc.dto.MemberDto;
import kr.ac.inhatc.mvc.dto.ProductDto;
import kr.ac.inhatc.mvc.mapper.ShopMapper;

@Service
public class ShopService {
	
	@Autowired
	ShopMapper shop;
	
	public MemberDto checkLogin(MemberDto dto) throws Exception {
		return shop.checkLogin(dto);
	}
	
	public int getOverlapId(String id) throws Exception {
		return shop.getOverlapId(id);
	}
	
	public int addUser(MemberDto dto) throws Exception {
		return shop.addUser(dto);
	}
}
