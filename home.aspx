<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel1" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel2" data-slide-to="1"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="bb.jpg?text=We'll be back scoon" alt="Image"   width="1400" height="300"/>
        <div class="carousel-caption">
          <h3>Get Registered here now</h3>
          <p></p>
        </div>      
      </div>

      <div class="item">
        <img src="bb.jpg" alt="Image"  width="1400" height="400"/>
        <div class="carousel-caption">
          <h3>Enjoy the game</h3>
          <p></p>
        </div>      
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
  
<div class="container text-center">    
  <h3>What We Do</h3><br>
  <div class="row">
    <div class="col-sm-4">
      <img src="Images/userImages/ss.jpg" class="img-responsive" style="width:100%" alt="Image"/>
      <p></p>
    </div>
    <div class="col-sm-4"> 
      <img src="Images/userImages/bdd.jpg" class="img-responsive" style="width:100%" alt="Image"/>
      <p></p>    
    </div>
    <div class="col-sm-4">
      <div class="well">
       <p>Success is where preparation and opportunity meet. </p>
      </div>
      <div class="well">
       <p>Suffer now and live the rest of your life as a champion</p>
      </div>
        <div class="well">
            <p>Talent win the game. But Teamwork wins the champion</p>
        </div>
    </div>
  </div>
</div><br>

<%--    <!-- start banner Area -->
			<section class="banner-area relative" id="home">
				<div class="overlay overlay-bg"></div>
				<div class="container">
						<div class="row fullscreen align-items-center justify-content-center" style="height: 915px;">
							<div class="banner-content col-lg-6 col-md-12">
								<h1>
									Our Next Event Starts in
								</h1>
				        		<div class="row clock_sec d-flex flex-row justify-content-between" id="clockdiv">
				                    <div class="clockinner">
				                        <span class="days"></span>
				                        <div class="smalltext">Days</div>
				                    </div>
				                    <div class="clockinner">
				                        <span class="hours"></span>
				                        <div class="smalltext">Hours</div>
				                    </div>
				                    <div class="clockinner">
				                        <span class="minutes"></span>
				                        <div class="smalltext">Minutes</div>
				                    </div>
				                    <div class="clockinner">
				                        <span class="seconds"></span>
				                        <div class="smalltext">Seconds</div>
				                    </div>

				                </div>
							</div>
						</div>
				</div>
			</section>--%>
			<!-- End banner Area -->
    <%-- cards --%>

</asp:Content>

