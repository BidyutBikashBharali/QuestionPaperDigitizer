<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<title>View Questions</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>


<style>
body,h1 {font-family: "Raleway", Arial, sans-serif}
h1 {letter-spacing: 6px}
.w3-row-padding img {margin-bottom: 12px}
</style>



<body>

<!-- !PAGE CONTENT! -->
<div class="w3-content" style="max-width:1500px">

<!-- Header -->
<header class="w3-panel w3-center w3-opacity" style="padding:20px 16px">
  <b class="w3-xxxlarge w3-text-blue">welcome</b>
  <p class="w3-large">Digitize Your Hard Copy Question Paper into a Web Form Automatically</p>
  
  <div class="w3-padding-32">
    <div class="w3-bar w3-border">
      <a href="Search" class="w3-bar-item w3-button">Search</a>
      <a href="index.html" class="w3-bar-item w3-button w3-light-grey">Home</a>
      <a href="About" class="w3-bar-item w3-button">About</a>
    </div>
  </div>
</header><br><br>

<!-- Start Content -->
<div class="w3-padding-large" style="margin-bottom:128px">
  
 <div class="w3-card w3-round-large w3-center w3-padding-large">

    

      
        <center>
          
       


      <c:choose>
       
         <c:when test="${requestScope.RCRD == 'NotAvailable' }">
             <h2 class="w3-xlarge w3-text-gray"><b>Not found!</b></h2>
         </c:when>
         
         
         
        
            
          <c:when test="${requestScope.DOC == 'Available' }"> 
              <br><br>
              <ul class="w3-ul w3-border w3-border-gray w3-round-large" style="width: 100%; max-width:800px">
              
               <c:if test="${requestScope.RCRD eq 'Available' }">
                  <c:forEach var="rcrd" items="${requestScope.RCRDDATA}">
                       <li class='w3-gray w3-text-white w3-padding-16 w3-large w3-justify'>
                          <h5><b>Title : </b> <i class="w3-text-white" style="font-size: 15px"> <c:out value="${rcrd.Title}"></c:out> </i></h5>

                          <h5><b>Details : </b> <i class="w3-text-white" style="font-size: 15px"> <c:out value="${rcrd.QFInfo}"></c:out> </i></h5>

                          <h5><b>Creator Email : </b> <i class="w3-text-white" style="font-size: 15px"> <c:out value="${rcrd.CEmail}"></c:out> </i></h5>
                       </li>
                       <li class="w3-center w3-tiny">
                          <a href="/QuestionPaperDigitization/ETG?id=<c:out value='${rcrd.UID}'></c:out>" ><Button class="w3-button w3-text-white w3-gray w3-round-large w3-center w3-tiny" style="font-size: 15px"><b>Export Questions Into Excel Template</b></Button></a>
                       </li>
                  </c:forEach>
               </c:if>
               
              <c:forEach var="docdata" items="${requestScope.DOCDATA}">
              
                  <li class="w3-text-blue w3-justify">
                      
                      <h6><b style="font-size: 17px"> <c:out value="${docdata.QN}"></c:out> </b> <i class="w3-text-gray" style="font-size: 17px"> <c:out value="${docdata.Question}"></c:out> </i></h6>
                      
                      <c:if test="${docdata.QImage ne 'NoSrc' }"> 
                      <b style="font-size: 13px">Diagram : </b><br><br> <img src="<c:out value='${docdata.QImage}'></c:out>" style="width:100%; max-width:350px" />
                      </c:if>
                      
                      <c:if test="${docdata.Label ne 'None' }">
                      <h6><b style="font-size: 12px"><c:out value="${docdata.Label}"></c:out> : </b></h6>
                      </c:if>
                      <c:forEach var="optn" items="${docdata.SQoMCQO}">
                          <c:if test="${optn ne 'None' }"> 
                             <h6> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="w3-text-gray" style="font-size: 12px"> <c:out value="${optn}"></c:out> </i></h6>
                          </c:if>
                      </c:forEach>
                      
                      <h6><b style="font-size: 12px">Marks : </b> <i class="w3-text-gray" style="font-size: 12px"> <c:out value="${docdata.Marks}"></c:out> </i></h6>
                      
                      <h6><b style="font-size: 12px">Type : </b> <i class="w3-text-gray" style="font-size: 12px"> <c:out value="${docdata.QType}"></c:out> </i></h6>
              
                  </li>
                  
               </c:forEach>
               
               </ul><br>
               
             
          </c:when>
           
         <c:otherwise>
               <h2 class="w3-small w3-text-gray"></h2>
               <br>
         </c:otherwise>
          
        </c:choose>

        </center>

    


 </div>
<!-- End Page Content -->
</div>


<!-- Footer -->
<footer class="w3-container w3-padding-32 w3-light-grey w3-center"> 
 <p>Thank You for visiting our website</p>
  <p>Connect with us on</p>
  <div class="w3-large">
  <i class='fab fa-facebook w3-text-blue' style='font-size:25px;'></i>&nbsp;&nbsp;&nbsp;
  <i class='fab fa-instagram w3-text-pink' style='font-size:25px;'></i>&nbsp;&nbsp;&nbsp;
  <i class='fab fa-snapchat w3-text-amber' style='font-size:25px;'></i>&nbsp;&nbsp;&nbsp;
  <i class='fab fa-twitter w3-text-blue' style='font-size:25px;'></i>&nbsp;&nbsp;&nbsp;
  <i class='fab fa-pinterest w3-text-red' style='font-size:25px;'></i>&nbsp;&nbsp;&nbsp;
  <i class='fab fa-linkedin w3-text-indigo' style='font-size:25px;'></i>
  </div>
 
</footer>
</div>





</body>
</html>
    