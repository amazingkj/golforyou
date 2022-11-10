<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" type="text/css" href="/css/abboard_cont.css" />
<link rel="stylesheet" type="text/css" href="/css/abcustomer.css" />
<jsp:include page="/WEB-INF/views/includes/adminheader.jsp" />
</head>
<body>
   <div id="all_box">
      
         <!-- // left navigation -->
      </div>
      <div class="first_box">
         <form method="post" id="frm" action="admin_board_edit_ok">
            <input type="hidden" name="page" value="${page}">
            
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
                     <td>${b.abboard_no}<input type="hidden" name="abboard_no"
                        value="${b.abboard_no}">
                     </td>
                     <th scope="row">조회수</th>
                     <td>${b.abboard_hit}</td>
                  </tr>
                  <tr>
                     <th scope="row">작성자</th>
                     <td><input name="abboard_name" size="14"
                        value="${b.abboard_name}" /></td>
                     <th scope="row">작성시간</th>
                     <td>${b.abboard_date}</td>
                  </tr>
                  <tr>
                     <th scope="row">제목</th>
                     <td><input name="abboard_title" size="14"
                        value="${b.abboard_title}" /></td>
                  </tr>
                  <tr>
                     <td colspan="4" class="view_text"><textarea style="resize:none;" rows="10"
                           cols="200" name="abboard_cont">${b.abboard_cont}</textarea></td>
                  </tr>
               </tbody>
            </table>
            <div>
               <input type="button" value="목록으로" class="btn"
                  onclick="location='abboard_list?page=${page}';"
                  style="cursor: pointer" /> 
               <input type="submit" value="저장하기" class="btn" style="cursor: pointer; margin-left:0px;" /> 
            </div>
         </form>
      </div>
      <div class="clear"></div>
   </div>
   
</body>
</html>