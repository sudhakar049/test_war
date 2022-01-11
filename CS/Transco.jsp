<html>
    <head>
        <meta charset="utf-8">
        <title>Searching Logs</title>
       	<link rel="stylesheet" href="css/jquery.ui.datepicker.css">
        <!--<link rel="stylesheet" href="css/demos.css">-->
        <link rel="stylesheet" href="css/jquery.ui.all.css">
        <script src="js/jquery-1.9.1.js" type="text/javascript"></script>
        <script src="js/jquery.ui.datepicker.js" type="text/javascript"></script>
        <script src="js/jquery.ui.core.js" type="text/javascript"></script>
        <script src="js/jquery.ui.widget.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function()
            {
                $( "#seldate" ).datepicker();
                $( "#seldate" ).datepicker( "option", "dateFormat","dd-mm-yy");  
                $( "#seldate" ).datepicker('setDate',new Date());
            
            });
            function clearDiv(){
                document.getElementById("myDiv").innerHTML="";
            }
            
            function radioWithText(d) {
                document.getElementById('meter').style.display = "none";
                document.getElementById('imei').style.display = "none";
                document.getElementById('modem').style.display = "none";
                document.getElementById(d).style.display='inline'; 
            }
            function getMeters(){ 
                document.getElementById("myDiv").innerHTML=document.getElementById("loading").innerHTML;
                $.ajax({
                    url: 'Meters.jsp?inputStr='+document.getElementById("inputStr").value+'&date='+document.getElementById("seldate").value,
                    type: 'post',
                    data: 'sree',
                    success: function(data) {
                        //                          alert("data==>"+data);
                        //called when successful
                        $('#myDiv').html(data);
                    },
                    error: function(e) {
                        //called when there is an error
                        //console.log(e.message);
                    }
                });
            }
            
           
        </script>

        <style>
            body{
                background-color: #F0FFFF;
            }
            h3,p{
                text-align: center;
                text-decoration:underline ;

            }
            #myform{
                width: 90%;                
                margin: 20px auto;
                border: 1px solid #222;
                background-color: #111;
                background-image: linear-gradient(#444, #111);
                border-radius: 6px;
                box-shadow: 0 1px 1px #777;
            }
            #myDiv{
                width: 90%;
                height:75%;
                background-color: #E6E6FF;
                margin: 20px auto;
                border: 1px solid #222;
                border-radius: 6px;
                box-shadow: 0 1px 1px #777;
                overflow-y:scroll;
            }
            td{
                color:#FFF;
                text-decoration: none;
                text-shadow: 0 1px 0 #000;
            }
            table{
                margin-left: 30px;
            }
            input{
                border-radius: 25px;
            }

        </style>
    </head>

    <body>
        <h3>Searching Log Files Based On Given Input</h3>
        <form name="myform" id="myform">
            <table >    
                <tr><td>Search By</td><td><input type="Text" id="inputStr" size="30"/></td>
                    <td>Date</td><td>
                        <!--<input type="Text" onfocus="if(!this._haschanged){this.value=''};this._haschanged=true;" value="dd-mm-yyyy" id="seldate"/>-->
                        <input type="Text"  value="" id="seldate"/>
                    </td>
                    <td><input type="button" value="Search" onClick="getMeters()"></td>
                    <td><input type="button" value="Clear" onClick="clearDiv()"></td>
                </tr>
            </table>

        </form>
        <h5 style="margin-left:5%;margin-top: 0px;margin-bottom: 0px; text-decoration: none;text-align:left;padding: 0px;">Search By Ex: Meter no,Modem no,SIM no,Mobile no...</h5>
        <div id="myDiv" sytle="border-style: double"></div>
        <div id="loading" style="display: none;">
            <img src="images/loader.gif" style="padding-top: 15%;padding-left:45%; " />
        </div>
    </body>
</html>