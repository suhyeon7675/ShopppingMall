<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${title} ${count}</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link type="text/css" rel="stylesheet"
	href="resource/res/css/sample.css" />
<script src="http://code.jquery.com/jquery-Latest.min.js"></script>
	
<script type="text/javaScript" language="javascript" defer="defer">
	function fn_regSubject() {
		document.listForm.action = "/regSubject.do";
		document.listForm.submit();
	}
	function fn_select(id) {
		document.listForm.action = "/boardDetail.do?no="+id;
		document.listForm.submit();
	}
	
	//10페이지 이전 버튼
	function fn_prevTen(page, range, startPage, searchCondition, searchKeyword){
		var page=parseInt(page);
		var range=parseInt(range);
		
		var startPage=parseInt(startPage);	//변수 선언 및 파라미터 값 세팅
		
		page = page - 10;					//현재 페이지보다 10 감소
		range = range - 1;					//현재 페이지가 속해있는 페이지 범위를 1 감소
		
		if(page < 1){						//만약 10 감소한 페이지, 즉 이동할 페이지가
			page = 1;						//1보다 작으면 page = 1로 설정하여 에러 방지
			range = 1;						//range = 1로 설정하여 에러 방지
		}
		
		var url = "/selectSubjectList";		
		url=url+"?page="+page;
		url=url+"&range="+range;
		url=url+"&searchCondition="+$('#searchCondition').val();
		url=url+"&searchKeyword="+searchKeyword;
		location.href=url;
	}

	//1페이지 이전 버튼
	function fn_prevOne(page, range, startPage, searchCondition, searchKeyword){
		var page=parseInt(page);
		var range=parseInt(range);
		var startPage=parseInt(startPage);	//변수 선언 및 파라미터 값 세팅

		if(page==startPage && range != 1){	//현재 페이지와 현재 페이지 범위의 시작 번호가 같고 현재 페이지 범위가 1이 아닌 경우
			range = range - 1;				//range 1 감소
			page = page - 1;				//page 1 감소
		}else if(page!=startPage){			//현재 페이지가 현재 페이지 범위의 시작 번호가 아닐 때
			page = page - 1;				//page 1 감소
		}else								//현재 페이지(page)와 현재 페이지 범위의 시작 번호(startPage)가 같고 
			return;							//현재 페이지 범위(range)가 1이면 변함없이 page=1, range=1 이다.
		
		var url = "/selectSubjectList";
		url=url+"?page="+page;
		url=url+"&range="+range;
		url=url+"&searchCondition="+$('#searchCondition').val();
		url=url+"&searchKeyword="+searchKeyword;
		location.href=url;
	}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchCondition, searchKeyword){
		var url="/selectSubjectList";
		url=url+"?page="+page;
		url=url+"&range="+range;
		url=url+"&searchCondition="+$('#searchCondition').val();
		url=url+"&searchKeyword="+searchKeyword;
		location.href=url;
	}

	//1페이지 다음 버튼
	function fn_nextOne(page, range, endPage, pageCnt, searchCondition, searchKeyword){
		var page=parseInt(page);
		var range=parseInt(range);
		var endPage=parseInt(endPage);
		var pageCnt=parseInt(pageCnt);			//변수 선언 및 파라미터 값 세팅

		if(page==endPage){					//만약 현재 페이지가 현재 페이지 범위의 마지막 페이지라면
			if(page==pageCnt){				//만약 현재 페이지가 전체 페이지의 마지막 페이지라면
				//alert("마지막 페이지 입니다.");
				return;
			} else {
				//alert("마지막 페이지가 아닌 현재범위 마지막 페이지");
				page = page + 1;			
				range = range + 1;
			}
		} else {							//현재 페이지가 현재 페이지 범위의 마지막 페이지가 아니라면
			page = page + 1;
			range = range;					//range 변함없음
		}
		
		
		var url = "/selectSubjectList";
		url=url+"?page="+page;
		url=url+"&range="+range;
		url=url+"&searchCondition="+$('#searchCondition').val();
		url=url+"&searchKeyword="+searchKeyword;
		location.href=url;
	}
	
	//10페이지 다음 버튼
	function fn_nextTen(page, range, startPage, pageCnt, rangeSize, searchCondition, searchKeyword){
		var page=parseInt(page);
		var range=parseInt(range);
		var startPage=parseInt(startPage);
		var pageCnt = pageCnt;				
		var rangeSize=rangeSize;			//변수 선언 및 파라미터 값 세팅

		page = page + 10;					//현재 페이지보다 10 증가

		if(page >= pageCnt && startPage > pageCnt-rangeSize){			//만약 이동할 페이지가 총 페이지 개수보다 크거나 같고
			page = pageCnt;				//현재 시작 페이지가 총 페이지 수 - 한 페이지 범위에서 보여줄 페이지 개수보다 크면 페이지를 총 페이지 개수로 설정
		}else if(page >= pageCnt && startPage <= pageCnt-rangeSize){	//만약 이동할 페이지가 총 페이지 개수보다 크거나 같고
			page = pageCnt;				//현재 시작 페이지가 총 페이지수 - 한 페이지 범위에서 보여줄 페이지 개수보다 작거나 같으면
			range = range+1;			//페이지를 총 페이지 개수로 설정하고 범위를 +1 시킴
		}else							//아니면
			range = range+1;			//범위 +1 시킴
		
		var url="/selectSubjectList";
		url=url+"?page="+page;
		url=url+"&range="+range;
		url=url+"&searchCondition="+$('#searchCondition').val();
		url=url+"&searchKeyword="+searchKeyword;
		location.href=url;
	}
	
	//검색 버튼 클릭
	$(document).on('click','#btnSearch',function(e){
		e.preventDefault();
		var key=$('#searchKeyword').val();
		if(key==''){					//검색어를 입력하지 않고 버튼을 누를 경우
			alert("검색어를 입력하세요");		//alert 띄움
			return;
		}
		var url="/selectSubjectList";
		url=url+"?searchCondition="+$('#searchCondition').val();	
		url=url+"&searchKeyword="+key;
		location.href=url;
	});
	
</script>
</head>

<body style="text-align: center; margin: 0 auto; display: inline; padding-top: 100px;">
	<form id="listForm" name="listForm" action="/sample/" method="post">
		<input type="hidden" name="selectedId" />
		<div id="content_pop">
			<!-- 타이틀 -->
			<div id="title">
				<ul>
					<li><img src="/resource/res/img/title_dot.gif" alt="" />과목 목록</li>
					<li>페이지 방문수 : ${count}</li>
				</ul>
			</div>
			<!-- 타이틀 -->
			
			<!-- 검색 -->
			<div id="search">
				<ul>
					<li>
						<label for="searchCondition" style="visibility: hidden;">검색어 선택</label>
						<select id="searchCondition" name="searchCondition" class="use">
							<option value="subject"<c:if test="${pagination.searchCondition == 'subject'}">selected='selected'</c:if> >Subject</option>
							<option value="userId"<c:if test="${pagination.searchCondition == 'userId'}">selected='selected'</c:if> >Writer</option>
						</select>
					</li>
					<li>
						<label for="searchKeyword" style="visibility: hidden; display: none;">검색어 입력</label>
						
						<!-- value로 searchKeyword를 넣어 검색 후에도 페이지 이동이 가능함 -->
						<input id="searchKeyword" name="searchKeyword" type="text" placeholder="검색" value="${pagination.searchKeyword}" />
					</li>
					<li>
						<button class="btn btn-outline-success btn-sm" type="button" id="btnSearch" style="height:20px; font-size:10.5px">검색</button>
					</li>
				</ul>
			</div>
			<!-- /검색 -->
			
			<!-- List -->
			<div id="table">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" summary="">
					<caption style="visibility: hidden"></caption>
					<colgroup>
						<col width="60" />
						<col width="200" />
						<col width="80" />
						<col width="80" />
						<col width="?" />
						<col width="80" />
					</colgroup>
					<tr>
						<th align="center">No</th>
						<th align="center">과목명</th>
						<th align="center">학년</th>
						<th align="center">개설여부</th>
						<th align="center">설명</th>
						<th align="center">등록자</th>
					</tr>
					<c:forEach var="result" items="${subjectList}" varStatus="status">
						<tr>
							<td align="center" class="listtd" onclick="javascript:fn_select('${result.id}')" style="cursor:pointer;">
								<c:out value="${result.id}"/>
							</td>
							<td align="center" class="listtd"><c:out value="${result.subject}"/></td>
							<td align="center" class="listtd"><c:out value="${result.grade}"/>학년&nbsp;</td>
							<td align="center" class="listtd"><c:out value="${result.use_yn}"/>&nbsp;</td>
							<td align="center" class="listtd"><c:out value="${result.description}"/>&nbsp;</td>
							<td align="center" class="listtd"><c:out value="${result.reg_user}"/>&nbsp;</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- /List -->
			
			<!-- 페이징 -->
			<div id="pagination" style="text-align:center">
				<!-- 10 페이지 이전 버튼 클릭시 fn_prevTen 함수 호출 -->
				<a href="#" onclick="fn_prevTen('${pagination.page}','${pagination.range}', 
					'${pagination.startPage}','${pagination.searchCondition}','${pagination.searchKeyword}')">
					<image src=/resource/res/img/btn_page_pre10.gif border=0 />
				</a>&#160;
				<!-- 1페이지 이전 버튼 클릭시 fn_prevOne 함수 호출 -->
				<a href="#" onclick="fn_prevOne('${pagination.page}','${pagination.range}',
					'${pagination.startPage}','${pagination.searchCondition}','${pagination.searchKeyword}')">
					<image src=/resource/res/img/btn_page_pre1.gif border=0 />
				</a>&#160;
				
				<!-- forEach를 사용해 각 페이지 범위의 개수만큼 페이지 목록 idx로 출력 -->
				<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
					<!-- 만약 현재 페이지와 idx가 같은 경우 idx를 붉은 글씨로 표현 -->
					<c:if test="${pagination.page == idx}">
						<a class="font-weight-bold text-danger" href="#" onclick="fn_pagination('${idx}','${pagination.range}',
						'${pagination.rangeSize}','${pagination.searchCondition}','${pagination.searchKeyword}')">${idx}</a>&#160;
					</c:if>
					<!-- 현재 페이지가 아닌 페이지 목록들 -->
					<c:if test="${pagination.page != idx}">
						<a href="#" onclick="fn_pagination('${idx}','${pagination.range}','${pagination.rangeSize}',
						'${pagination.searchCondition}','${pagination.searchKeyword}')">${idx}</a>&#160;
					</c:if>
				</c:forEach>
				
				<!-- 1페이지 다음 버튼 클릭시 fn_nextOne 함수 호출 -->
				<a href="#" onclick="fn_nextOne('${pagination.page}','${pagination.range}', '${pagination.endPage}',
					'${pagination.pageCnt}','${pagination.searchCondition}','${pagination.searchKeyword}')">
					<image src=/resource/res/img/btn_page_next1.gif border=0 />
				</a>&#160;
				<!-- 10페이지 다음 버튼 클릭시 fn_nextTen 함수 호출 -->
				<a href="#" onclick="fn_nextTen('${pagination.page}','${pagination.range}', '${pagination.startPage}',
					'${pagination.pageCnt}','${pagination.rangeSize}','${pagination.searchCondition}','${pagination.searchKeyword}')">
					<image src=/resource/res/img/btn_page_next10.gif border=0 />
				</a>&#160;
			</div>
			<!-- /페이징 -->
			
			<div id="sysbtn">
				<ul>
					<li>
						<button onclick="javascript:fn_regSubject()" class="btn btn-outline-info btn-sm" 
						type="button" id="btnInsert" style="height:20px; font-size:10.5px">등록</button>
					</li>
				</ul>
			</div>
		</div>
	</form>
</body>
</html>
