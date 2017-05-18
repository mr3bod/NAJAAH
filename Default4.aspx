<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="dist/js/Sortable.js"></script>
    <script src="dist/js/jquery-ui.min.js"></script>
    <link href="dist/css/animate.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Left" Runat="Server">

        <div class="panel panel-default">
        <div class="panel-body">
				<div id="D" class="tile__list" style="min-height:101px;">
                   
                                      
                                       
				</div>
            </div>
            </div>
<script>
    // Simple list
    Sortable.create(D, {
        group: "course", animation: 150, dropOnEmpty:true});
</script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Main" Runat="Server">
        <style>
        .Sem1 {
            border:solid;
            border-bottom-style:dashed;
            border-radius:8px 8px 0px 0px;
            background-color:#EEEEEE;
            min-height:75px;
        }
        .Sem2 {
            border:solid;
            border-top-style:none;
            border-radius:0px 0px 8px 8px;
            background-color:#EEEEEE;
            margin-bottom:10px;
            min-height:75px;
        }
        .summer {
            border:solid;
            border-radius: 8px;
            background-color:#EEEEEE;
            margin-bottom:10px;
            min-height:75px;
        }
        .ghost{
            width:108px;
            height:70px;

        }
    </style>
<a name="m"></a>
	<div class="container" style="width:100%;">
		        <div id="Freshman1" class="Sem1" >
                    <span>
					    <svg width="108" height="70">

                        <rect x="25%" y="25%" rx="5" ry="5" width="70%" height="65%"
                        style="fill:gray;stroke:#3b3939; stroke-width:2px"; />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">MATH 101</text>
                         
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="65%">F</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="50%" y="65%">(151)</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="85%">A+</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="50%" y="85%">(152)</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">4</text>
                        </svg>
                   </span>
                   <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">CHEM 101</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">4</text>
                        </svg>
                   </span>
                   <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">PE 101</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana"x="84%" y="84%">1</text>
                        </svg>
                   </span>
                                       <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5" w width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">PHYS 101</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">4</text>
                        </svg>
                   </span>
                                       <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">ENGL 101</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">3</text>
                        </svg>
                   </span>
                     <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">IAS 101</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">2</text>
                        </svg>
                   </span>
		        </div>
                <div id="Freshman2" class="Sem2" >
                    <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px"; />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">MATH 102</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">4</text>
                        </svg>
                   </span>
                   <span>
					    <svg width="108" height="70">
                            <image x="28" y="60" width="70" height="15" xlink:href="img/Light-Rotated.svg"/>
                            <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                            style="fill:white;stroke:#3b3939; stroke-width:2px"; />
                                <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">ICS 102</text>
                                <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                                <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                                <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">3</text>
                        </svg>
                   </span>
                   <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">PE 102</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">1</text>
                        </svg>
                   </span>
                                       <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">PHYS 102</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">4</text>
                        </svg>
                   </span>
                                       <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">ENGL 102</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">3</text>
                        </svg>
                   </span>
                     <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";"/>
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">IAS 111</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">2</text>
                        </svg>
                   </span>
		        </div>
                <div id="Sphmor1" class="Sem1">
                    <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px"; />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">MATH 201</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">3</text>
                        </svg>
                   </span>
                   <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">ICS 253</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">3</text>
                        </svg>
                   </span>
                   <span>
					    <svg width="108" height="70">
                            <image x="28" y="0" width="70" height="15" xlink:href="img/Light.svg" id="color" />
                            <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                            style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                                <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">SWE 205</text>
                                <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                                <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                                <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">3</text>
                        </svg>
                   </span>
                                       <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">ICS 201</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">4</text>
                        </svg>
                   </span>
                                       <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">COE 202</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">3</text>
                        </svg>
                   </span>
                     
		        </div>
                <div id="Sphmor2" class="Sem2">
                    <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px"; />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">ICS 254</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">3</text>
                        </svg>
                   </span>
                   <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">SWE 215</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">3</text>
                        </svg>
                   </span>
                   <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">ICS 202</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">4</text>
                        </svg>
                   </span>
                                       <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">ICS 233</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">4</text>
                        </svg>
                   </span>
                                       <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">IAS 201</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">2</text>
                        </svg>
                   </span>
                     
		        </div>
                <div id="Junior1" class="Sem1">
                    <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px"; />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">ٍSTAT 319</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">3</text>
                        </svg>
                   </span>
                   <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">SWE 316</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">3</text>
                        </svg>
                   </span>
                   <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">SWE 312</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">3</text>
                        </svg>
                   </span>
                                       <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">ICS 324</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">4</text>
                        </svg>
                   </span>
                                       <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">IAS 212</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">2</text>
                        </svg>
                   </span>
                     
		        </div>
                <div id="Junior2" class="Sem2">
                    <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px"; />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">SWE 387</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">3</text>
                        </svg>
                   </span>
                   <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">SWE 326</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">3</text>
                        </svg>
                   </span>
                   <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">SWE 363</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">3</text>
                        </svg>
                   </span>
                                       <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">ICS 343</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">4</text>
                        </svg>
                   </span>
                                       <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">ENGL 214</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">3</text>
                        </svg>
                   </span>
                     <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">IAS 322</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">3</text>
                        </svg>
                   </span>
		        </div>
                <div id="Summar" class="summer">
                    <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">SWE 399</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">0</text>
                        </svg>
                   </span>
		        </div>
                <div id="Seneior1" class="Sem1">
                    <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px"; />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">ICS 353</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">3</text>
                        </svg>
                   </span>
                   <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5" width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">SWE 417</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">3</text>
                        </svg>
                   </span>
                   <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5" width="70%" height="65%"
                        style="fill:#F0AD4E;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">SWE xxx</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">3</text>
                        </svg>
                   </span>
                                       <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:#F0AD4E;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">XE xxx</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">3</text>
                        </svg>
                   </span>
                                       <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">SE 307</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana"x="84%" y="84%">3</text>
                        </svg>
                   </span>
                  
		        </div>
                <div id="Seneior2" class="Sem2">
                    <span class="ghost">
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:#F0AD4E;stroke:#3b3939; stroke-width:2px"; />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">SWE xxx</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">3</text>
                        </svg>
                   </span>
                   <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">SWE 418</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">2</text>
                        </svg>
                   </span>
                   <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:#F0AD4E;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">XE xxx</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">3</text>
                        </svg>
                   </span>
                                       <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">ICS 431</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">4</text>
                        </svg>
                   </span>
                                       <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:#F0AD4E;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">SWE xxx</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">3</text>
                        </svg>
                   </span>
                     <span>
					    <svg width="108" height="70">
                        <rect x="25%" y="25%" rx="5" ry="5"  width="70%" height="65%"
                        style="fill:white;stroke:#3b3939; stroke-width:2px";" />
                            <text fill="black" font-size="12" font-family="Verdana" x="30%" y="45%">IAS 301</text>
                            <text fill="black" font-size="12" font-family="Verdana" x="53" y="27"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="36" y="55"></text>
                            <text fill="black" font-size="12" font-family="Verdana" x="84%" y="84%">2</text>
                        </svg>
                   </span>
		        </div>
	</div>

<script>
    // Simple list
    Sortable.create(Freshman1, { group: "course", animation: 500, ghostClass: "ghost"});
    Sortable.create(Freshman2, { group: "course", animation: 150, dragClass: "ghost" });
    Sortable.create(Sphmor1, { group: "course", animation: 150, dragClass: "ghost" });
    Sortable.create(Sphmor2, { group: "course", animation: 150, ghostClass: "ghost" });
    Sortable.create(Junior1, { group: "course", animation: 150, ghostClass: "ghost" });
    Sortable.create(Junior2, { group: "course", animation: 150, ghostClass: "ghost" });
    Sortable.create(Summar, { group: "course", animation: 150, chosenClass: "ghost" });
    Sortable.create(Seneior1, { group: "course", animation: 150, ghostClass: "ghost" });
    Sortable.create(Seneior2, { group: "course", animation: 150, ghostClass: "ghost" });
</script>
 
 
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="right" Runat="Server">
     <div class="panel panel-default">
        <div class="panel-body">
				
          <div style="border:solid">
              <span id="CumGPA" >Cumulative GPA:  </span>
          </div>
            <br />
            <div style="border:solid">
              <span id="MajorGPA">Major GPA:  </span>
          </div>
            <br />
            <input style=" background-color:aquamarine ; width:100%; text-align:center;  white-space: normal;" type="button" value="Make Next Semester Plan" />

             
            </div>
            </div>
</asp:Content>

