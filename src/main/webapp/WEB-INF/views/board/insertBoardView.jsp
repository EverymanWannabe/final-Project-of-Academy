<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }

        #enrollForm>table {width:100%;}
        #enrollForm>table * {margin:5px;}
    </style>
</head>
<body>
        
    <%@include file="../common/header.jsp" %>

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>게시글 작성하기</h2>
            <br>

            <form id="enrollForm" method="post" action="insert.bo" enctype="multipart/form-data" onsubmit="return selectCategory()">
                <table algin="center">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="boardTitle" required></td>
                    </tr>
                    <tr> 
                    	<th><label for="category">카테고리</label> </th>
                    	<td><select id="category" name="category">
                    			<option value="0">카테고리를 골라주세요</option>
                    			<c:forEach items="${ctList}" var="ct"> 
                    				<option value="${ct.categoryNo}">${ct.categoryName}</option>
                    			</c:forEach>
                    		</select>
                    	</td>
                    </tr>
                    <tr>
                        <td><input type="hidden" id="writer" class="form-control" value="${loginUser.userNo }" name="boardWriter" readonly></td>
                    </tr>
                    <tr>
                        <th><label for="upfile">첨부파일</label></th>
                        <td><input type="file" id="upfile" class="form-control-file border" name="upfile" multiple></td>
                    </tr>
                    <tr>
			       		<td>
			       			<img class="card-img-top mb-5 mb-md-0" id="board1">
			       		</td>
			       </tr>
                    <tr>
                        <th><label for="content">내용</label></th>
                        <td><textarea id="content" class="form-control" rows="10" style="resize:none;" name="boardContent" required></textarea></td>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary">등록하기</button>
                    <button type="reset" class="btn btn-danger">취소하기</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>
    <script>
    //카테고리 선택 안했을시 나오는 함수
    function selectCategory(){
    	
    	var category= document.getElementById("category").value;
    	
    	if(category==0){
    		alert("카테고리를 선택해주세요");
    		
    		return false;
    		
    	}
    }
    $(function(){
		$("#board1").click(function(){
			$("#upfile").click();
		});
	});
	
	function loadImg(inputFile,num){
		
		if(inputFile.files.length==1){
			var reader = new FileReader();
			
			reader.readAsDataURL(inputFile.files[0]);
			
			reader.onload =function(e){
					$("#board1").attr("src",e.target.result);
				}
			}else{
				$("#board1").attr("src",null);
		}
	}
    </script>
    
    
</body>
</html>