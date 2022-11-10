<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head><link rel="stylesheet" type="text/css" href="/css/abcustomer.css" />

<link rel="stylesheet" type="text/css" href="/css/abboard_cont.css" />
<jsp:include page="/WEB-INF/views/includes/adminheader.jsp" />  
</head>
<body>
   <div id="all_box">
   </div>
      <div class="first_box">
         <form id="frm" method="post" action="admin_board_edit_ok">
            <table class="board_view">
               <colgroup>
                  <col width="10%" />
                  <col width="30%" />
                  <col width="10%" />
                  <col width="30%" />
               </colgroup>
               <caption id="main_text">공지사항</caption>
               <tbody>
                  <tr>
                     <th scope="row">글 번호</th>
                     <td>${b.abboard_no}<input type="hidden" id="IDX" name="no"
                        value="${b.abboard_no}">
                     </td>
                     <th scope="row">조회수</th>
                     <td>${b.abboard_hit}</td>
                  </tr>
                  <tr>
                     <th scope="row">작성자</th>
                     <td>${b.abboard_name}<input type="hidden" id="IDX" name="board_name"
                        value="${b.abboard_name}"></td>
                     <th scope="row">작성시간</th>
                     <td>${b.abboard_date}</td>
                  </tr>
                  <tr>
                     <th scope="row">제목</th>
                     <td>${b.abboard_title}<input type="hidden" id="IDX" name="board_title"
                        value="${b.abboard_title}"></td>
                  </tr>
                  <tr>
                     <td colspan="4" class="view_text"><textarea
                           style="pointer-events:none; resize:none;" readonly rows="10" cols="200" >${b.abboard_cont}</textarea>
                           <input type="hidden" id="IDX" name="cont" 
                           value="${b.abboard_cont}">
                     </td>
                  </tr>
               </tbody>
            </table>
            <table>
               <tr>
                  <th><input type="button" value="목록으로" class="btn"
                     onclick="location='abboard_list?page=${page}';"
                     style="cursor: pointer" /></th>
                  <th><input type="button" value="수정하기" class="btn" 
                     onclick="location= 'abboard_cont?no=${b.abboard_no}&page=${page}&state=edit';"
                     style="cursor: pointer; margin-left: 0px;" /></th>

               </tr>
            </table>
         </form>
      </div>
      <div class="clear"></div>


</body>
</html>