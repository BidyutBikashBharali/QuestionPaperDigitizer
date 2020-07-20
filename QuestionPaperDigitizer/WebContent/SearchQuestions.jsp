<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<title>Search</title>
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
        
        
          <br>
   <c:if test="${requestScope.PSWRD eq 'Available' }">
        <form   method="post" action="Search"  style="width:70%; display:none;">
   </c:if>
   <c:if test="${requestScope.PSWRD ne 'Available' }">
        <form   method="post" action="Search"  style="width:70%; display:block;">
   </c:if>
          
 
          <input class="w3-input" placeholder=" Enter your email" type="email" name="email" required>
          
          <button class="w3-button w3-hover-white"><i class='fa fa-search w3-text-blue' style='font-size:25px'></i></button>
          

        </form>
    

      <c:choose>
       
         <c:when test="${requestScope.RCRD == 'NotAvailable' }">
             <h2 class="w3-xlarge w3-text-gray"><b>Data not found!</b></h2>
         </c:when>
         
         <c:when test="${requestScope.UPDATE == 'Available' }">
             <h2 class="w3-xlarge w3-text-gray"><b>Content Updated!</b></h2>
         </c:when>
         
         <c:when test="${requestScope.DELETE == 'Available' }">
             <h2 class="w3-xlarge w3-text-gray"><b>Content Deleted!</b></h2>
         </c:when>
         
         <c:when test="${requestScope.PSWRD == 'Available' }">
             <c:if test="${requestScope.WP eq 'Available' }">
                 <h2 class="w3-large w3-text-red">Incorrect password!</h2>
             </c:if>
         
             <form  method="post" action="PasswordValidation"  style="width:70%;">

                <input class="w3-input" placeholder=" Enter password" type="password" name="password" required>
                <br>
                <button class="w3-button w3-round-large w3-blue">Submit</button>
          
             </form>
         </c:when>
         
         
        <c:when test="${requestScope.RCRD == 'Available' }">
            
            
              <br><br>
              <ul class="w3-ul w3-border w3-border-gray w3-round-large" style="max-width: 800px; width: 100%;">
                  <li class='w3-gray w3-text-white w3-padding-32 w3-large'><b>Here's a list of question's title and details, you created with your email <c:if test="${requestScope.Email ne null }"> '<c:out value="${requestScope.Email}"></c:out>' </c:if> </b></li>
              
              <c:forEach var="rcrd" items="${requestScope.RCRDDATA}">
              
                  <li class="w3-text-blue w3-justify">
                      
                      <a href="/QuestionPaperDigitization/View?id=<c:out value='${rcrd.UID}'></c:out>"><Button class="w3-button w3-hover-white w3-tiny w3-text-gray w3-right"><i class='far fa-arrow-alt-circle-right w3-text-blue' style='font-size:20px'></i></Button></a>
                      <div class="w3-dropdown-hover w3-left w3-padding-small w3-white" >
                      
                      <div class="w3-text-blue"><i class='fas fa-ellipsis-h ' style='font-size:20px'></i></div>

                      <div class="w3-dropdown-content w3-bar-block w3-card-2 w3-padding-tiny w3-zoom" style="right:">
                          <a href="/QuestionPaperDigitization/Edit?id=<c:out value='${rcrd.UID}'></c:out>"><Button class="w3-button w3-hover-white w3-tiny w3-text-gray"><b>Edit</b></Button></a><br>
                          <a href="/QuestionPaperDigitization/Delete?id=<c:out value='${rcrd.UID}'></c:out>"><Button class="w3-button w3-hover-white w3-tiny w3-text-gray"><b>Delete</b></Button></a>
                      </div>
                      
                      </div><br>


              
                      <h6><b>Title : </b> <i class="w3-text-gray" style="font-size: 14px"> <c:out value="${rcrd.Title}"></c:out> </i></h6>
                      <h6><b>Details : </b> <i class="w3-text-gray" style="font-size: 14px"> <c:out value="${rcrd.QFInfo}"></c:out> </i></h6>
                      
                  </li>
               </c:forEach>
               
               </ul><br>
               
             
         </c:when>
           
         <c:otherwise>
               <h2 class="w3-small w3-text-gray">Search here list of question paper you created by entering correct email you set</h2>
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
    