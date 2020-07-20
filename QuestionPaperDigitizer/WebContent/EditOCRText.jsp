<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
<title>Edit Extracted Text</title>
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

<style type="text/css">
  #show,#content{display:none;}
#show:checked~#content{display:block;}
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
  
 <div class="w3-card w3-round-large w3-center w3-padding-32">

<c:if test="${requestScope.ocrtext ne null }">

      <form id="myForm" method="post" action="GEOCRT" class="w3-padding-large">
         <h2 class="w3-xlarge w3-text-blue"><b>Check below extracted text and edit if something is not correct</b></h2><br>
         
        <textarea name="EditedOCRText" class="w3-input w3-border  w3-round-large"  rows="15" cols="100" placeholder="   Extracted text   " style="resize:none;" /><c:out value="${requestScope.ocrtext}"></c:out></textarea>
      
        
        <br><input type="submit" style="display:none;"/>
        
      </form>




        

    

      
      
      <br>
      <button onclick="document.getElementById('id01').style.display='block'" class="w3-button w3-blue  w3-round">Continue</button>



      <div id="id01" class="w3-modal">
      <div class="w3-modal-content w3-light-gray w3-card-4 w3-animate-zoom" style="max-width:600px">

      
        <div class="w3-container w3-white  w3-center w3-padding-large" >
          <div class="w3-white ">
            <h1 class="w3-round w3-xlarge w3-text-shadow"><strong>Are you sure to submit it as your final content to set question?</strong></h1>
            <p class="w3-text-gray w3-text-shadow">Click on 'No', if you need to edit extracted text.</p>
          </div>
        </div>

      

      
      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-btn w3-red w3-round-large w3-left">No</button> 
        <button id="myButton" type="button" class="w3-btn w3-blue w3-round-large w3-right">Yes</button>
      </div>

    </div>
     <br><br><br>
    </div>



    <br>
    </div>

</c:if>

<c:if test="${requestScope.ocrtext eq null }">
<h2 class="w3-xxlarge w3-text-red"><center><b>Access Denied!</b></center></h2><br>
</c:if>

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



<script type="text/javascript">
    $(document).ready(function() {


      $(".add-more").click(function(){ 

          var html = $(".copy").html();

          $(".after-add-more").after(html);

      });


      $("body").on("click",".remove",function(){ 

          $(this).parents(".control-group").remove();

      });


    });
</script>

<script type="text/javascript">
    $(document).ready(function() {
       $("#myButton").click(function() {
           $("#myForm").submit();
       });
    });
</script>

</body>
</html>
    