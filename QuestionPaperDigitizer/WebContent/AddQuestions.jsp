<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
<title>Add Questions</title>
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

<c:if test="${requestScope.EditedOCRText ne null }">

      <form method="post" action="Add" enctype="multipart/form-data" >
         
        <div class="control-group after-add-more w3-padding-large">
          <center>
            <h2 class="w3-xlarge w3-text-blue"><b>Drag or Copy extracted questions from the textarea below and Drop or Copy to the question fields and fill other related fields</b></h2><br>
          <input type="email" name="email" placeholder="Your email" style="width:100%; max-width:800px" class="w3-input " required/><br>
          
          
          <input type="password" name="password" id="password" placeholder="Set a Password to access later" style="width:100%; max-width:800px" class="w3-input " required/><br>
          <input type="password" name="confirm_password" id="confirm_password" placeholder="Confirm Password" style="width:100%; max-width:800px" class="w3-input " required/>
          <p class="w3-tiny"><b><span id='message'></span></b></p><br>
          
          <script type="text/javascript">
          $('#password, #confirm_password').on('keyup', function () {
        	  if ($('#password').val() == $('#confirm_password').val()) {
        	    $('#message').html('Password Matching').css('color', 'gray');
        	  } else 
        	    $('#message').html('Not Matching').css('color', 'red');
        	});
          </script>
          
          
          <input type="text" name="title" placeholder=" Title for your question form" style="width:100%; max-width:800px" class="w3-input " required/><br><br>
           <p class="w3-tiny w3-text-gray"><b>You can enter some details like 'Total Marks', 'Duration', 'Year' etc and don't forget to use space and commas(,) between each information</b></p>
          <textarea name="qinfo" style="width:100%; max-width:800px; resize:none;" class=" w3-round-large w3-border w3-input "  rows="3" cols="10" placeholder=" Enter some details here "  required></textarea><br><br><br>
          </center>





          <textarea name="question" class="w3-input "  rows="1" cols="10" placeholder="  Drop Your Question Here" style="resize:none;" required></textarea>
          
            <div class="w3-dropdown-hover w3-left w3-padding-small" >
            <div class="w3-text-blue w3-small w3-padding-small w3-round"><i class='fas fa-ellipsis-h ' style='font-size:22px'></i></div>

              <div class="w3-dropdown-content w3-bar-block w3-card-4 w3-animate-zoom w3-padding">
                

                  <select class="w3-select w3-small w3-text-blue" name="qType"  required>
                    <option disabled selected>Set question Type</option>
                    <option value="Short-Answer Question">Short-Answer Question</option>
                    <option value="Medium-Answer Question">Medium-Answer Question</option>
                    <option value="Long-Answer Question">Long-Answer Question</option>
                    <option value="Multiple Choice Question(MCQ)">Multiple Choice Question(MCQ)</option>
                  </select><br><br>
                  

                 <details>
                 <summary class="w3-small w3-text-blue">Set sub-questions or options for MCQ( Optional )</summary><br>
                 <i class="w3-tiny w3-text-gray">Set a label for sub-questions or options of MCQ</i>
                 <input class="w3-input w3-small" type="text" name="label" value="None" required/><br>
                 <i class="w3-tiny w3-text-gray">Set sub-questions or options for MCQ</i>
                 <p class="w3-tiny">
                  <input class="w3-input w3-tiny " type="text" name="sqomcqo" value="None" required/>
                  <input class="w3-input w3-tiny " type="text" name="sqomcqo" value="None" required/>
                  <input class="w3-input w3-tiny " type="text" name="sqomcqo" value="None" required/>
                  <input class="w3-input w3-tiny " type="text" name="sqomcqo" value="None" required/>
                  <input class="w3-input w3-tiny " type="text" name="sqomcqo" value="None" required/>
                  <input class="w3-input w3-tiny " type="text" name="sqomcqo" value="None" required/>
                  <input class="w3-input w3-tiny " type="text" name="sqomcqo" value="None" required/>
                  <input class="w3-input w3-tiny " type="text" name="sqomcqo" value="None" required/>
                  <input class="w3-input w3-tiny " type="text" name="sqomcqo" value="None" required/>
                  <input class="w3-input w3-tiny " type="text" name="sqomcqo" value="None" required/>
                 </p>
                 </details>

                <br>
                <details>
                 <summary class="w3-small w3-text-blue"><i class='fas fa-image w3-text-blue w3-large' style='font-size:22px'></i> ( Optional )</summary>

                 <p class="w3-tiny">
                       <input type="file" name="qimage" accept="image/*" class="w3-padding-small w3-card-4 w3-border  w3-round-large  w3-tiny"/>
                 </p>

                </details>
                
                <br>
                <details>
                 <summary class="w3-small w3-text-blue">Set marks for this question( Mandatory )</summary>

                 <p class="w3-tiny">
                       <input type="number" name="marks" size="10" class=" w3-round-large" min="1" max="100" required>
                 </p>

                </details>
                

            </div>
          </div>
          <br>

        </div>
        
        <br><br><input type="submit" class="w3-button w3-blue w3-small w3-round " value="Add"/>
        
      </form>



        <!-- Copy Fields -->

        <div class="copy w3-hide">

          <div class="control-group w3-padding-large">

             
             <textarea name="question" class="w3-input "  rows="1" cols="10" placeholder="  Drop Your Question Here" style="resize:none;" required></textarea>
            
            <button class="w3-button w3-hover-white remove w3-right"><i class='w3-large fas fa-minus-circle w3-text-red' style='font-size:22px'></i></button>



            <div class="w3-dropdown-hover w3-left w3-padding-small" >
            <div class="w3-text-blue w3-small w3-padding-small w3-round"><i class='fas fa-ellipsis-h ' style='font-size:22px'></i></div>

              <div class="w3-dropdown-content w3-bar-block w3-card-4 w3-animate-zoom w3-padding">
                

                  <select class="w3-select w3-small w3-text-blue" name="qType"  required>
                    <option disabled selected>Set question Type</option>
                    <option value="Short-Answer Question">Short-Answer Question</option>
                    <option value="Medium-Answer Question">Medium-Answer Question</option>
                    <option value="Long-Answer Question">Long-Answer Question</option>
                    <option value="Multiple Choice Question(MCQ)">Multiple Choice Question(MCQ)</option>
                  </select><br><br>
                  

                 <details>
                 <summary class="w3-small w3-text-blue">Set sub-questions or options for MCQ( Optional )</summary><br>
                 <i class="w3-tiny w3-text-gray">Set a label for sub-questions or options of MCQ</i>
                 <input class="w3-input w3-small" type="text" name="label" value="None" required/><br>
                 <i class="w3-tiny w3-text-gray">Set sub-questions or options for MCQ</i>
                 <p class="w3-tiny">
                  <input class="w3-input w3-tiny " type="text" name="sqomcqo" value="None" required/>
                  <input class="w3-input w3-tiny " type="text" name="sqomcqo" value="None" required/>
                  <input class="w3-input w3-tiny " type="text" name="sqomcqo" value="None" required/>
                  <input class="w3-input w3-tiny " type="text" name="sqomcqo" value="None" required/>
                  <input class="w3-input w3-tiny " type="text" name="sqomcqo" value="None" required/>
                  <input class="w3-input w3-tiny " type="text" name="sqomcqo" value="None" required/>
                  <input class="w3-input w3-tiny " type="text" name="sqomcqo" value="None" required/>
                  <input class="w3-input w3-tiny " type="text" name="sqomcqo" value="None" required/>
                  <input class="w3-input w3-tiny " type="text" name="sqomcqo" value="None" required/>
                  <input class="w3-input w3-tiny " type="text" name="sqomcqo" value="None" required/>
                 </p>
                 </details>

                <br>
                <details>
                 <summary class="w3-small w3-text-blue"><i class='fas fa-image w3-text-blue w3-large' style='font-size:22px'></i> ( Optional )</summary>

                 <p class="w3-tiny">
                       <input type="file" name="qimage" accept="image/*" class="w3-padding-small w3-card-4 w3-border  w3-round-large  w3-tiny"/>
                 </p>

                </details>
                
                <br>
                <details>
                 <summary class="w3-small w3-text-blue">Set marks for this question( Mandatory )</summary>

                 <p class="w3-tiny">
                       <input type="number" name="marks" size="10" class=" w3-round-large"  min="1" max="100" required>
                 </p>

                </details>
                

            </div>
          </div>
          <br>
            
          
          </div>

        </div>

        

    <br><br>
    <div class="w3-padding-large">
      <button class="w3-button w3-hover-white add-more"><i class='fas fa-plus-circle w3-text-blue' style='font-size:45px'></i></button>

      <br>

      <textarea name="extractedtext" class="w3-input w3-border  w3-round-large"  rows="10" cols="100" placeholder="       Edited content of extracted text   " style="resize:none;" /><c:out value="${requestScope.EditedOCRText}"></c:out></textarea>
      

    <br>
    </div>

</c:if>

<c:if test="${requestScope.EditedOCRText eq null }">
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


</body>
</html>
    