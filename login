+<!DOCTYPE html>
+<html>
+<head>
+
+  <meta charset="utf-8">
+  <meta name="viewport" content="width=device-width, initial-scale=1">                                      <!-- Responsive Meta Tag -->
+  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">      <!-- Downloaded Bootstrap Folders -->
+  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>                  <!-- Downloaded Bootstrap Folders -->
+  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>               <!-- Downloaded Bootstrap Folders -->
+
+<title>StudentView</title>    <!--Website Title-->
+</head>
+
+<body>
+
+
+<h2 style="text-align:center;">Web & Database Project</h2> <!--Website Heading -->
+<hr />
+<h3 style="text-align:center; color:red; ">LOGIN PAGE</h3> <!--Page Heading-->
+<hr />
+
+
+<p style="text-align:center;">Please enter your details below:</p> 
+
+<div class="container">
+	<div class="row">
+     
+<form class="form-horizontal"> <!--Login Form-->
+<fieldset> <!--Used to group related elements in a form-->
+
+
+<!-- Email-->
+<div class="form-group">
+  <label class="col-md-4 control-label" for="textinput">Email</label>  
+  <div class="col-md-4">
+  <input id="textinput" name="textinput" placeholder="12345678@studentmail.ul.ie" class="form-control input-md" required="" type="text">
+  <span class="help-block"> </span>  
+  </div>
+</div>
+
+<!-- Password-->
+<div class="form-group">
+  <label class="col-md-4 control-label" for="textinput">Password</label>  
+  <div class="col-md-4">
+  <input id="textinput" name="textinput" placeholder="Enter your Password" class="form-control input-md" required="" type="text">
+  <span class="help-block"> </span>  
+  </div>
+</div>
+
+
+<!-- Login Button -->
+<div class="form-group">
+  <label class="col-md-4 control-label" for="singlebutton"> </label>
+  <div class="col-md-4">
+    <button id="singlebutton" name="singlebutton" class="btn btn-primary">Login</button>
+  </div>
+</div>
+
+
+<!--Register Now-->
+<div class="form-group">
+  <label class="col-md-4 control-label" for="singlebutton"> </label>
Add a comment to this line
+  <div class="col-md-4">
+		<p> New Member? <a href="registration.html">Register Now!
+</div>
+</div>
+
+
+</fieldset>
+</form>
+  
+	</div>
+</div>
+
+
+
+</body>
+</html>
