package kr.ac.inhatc.mvc.mapper;

import kr.ac.inhatc.mvc.dto.MemberDto;
import kr.ac.inhatc.mvc.dto.ProductDto;

public interface ShopMapper {
	public MemberDto checkLogin(MemberDto dto) throws Exception;
	
	public int getOverlapId(String id) throws Exception;
	
	public int addUser(MemberDto dto) throws Exception;
}