<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="TAAFinalProject._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Click that Goat</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>  
        <h2>HELLLLLLLOOOOOOOOOO <span data-bind="text: fullName"></span>! Are you excited to count these majestic beasts?</h2>
        <p>First name: <input data-bind="value: firstName" /></p>
        <p>Last name: <input data-bind="value: lastName" /></p>

        <div>You've counted <span data-bind='text: numberOfClicks'></span> goats</div>
        <div><img width="200" height="300" src="goat.jpg"/> </div>
        <button data-bind='click: registerClick, disable: goatCountMaster' >Click for the love of goat</button>
 
        <div data-bind='visible: goatCountMaster'>
        <h1>You're the G.O.A.T. GOAT COUNTER! They sing your praises til the cows come home</h1>
        <img width="400" height="200" src="sing_goat.jpg" />
        <br /><button data-bind='click: resetClicks'>Do it again! :D</button>
        </div>
      
    </div>  
    </form>  
    <script src="Scripts/knockout-3.4.2.js"></script>  
    <script type="text/javascript">  
        //View Model!
        var ViewModel = function (first, last) {
            this.firstName = ko.observable(first);
            this.lastName = ko.observable(last);

            this.fullName = ko.pureComputed(function () {
                
                return this.firstName() + " " + this.lastName();
            }, this);
            this.numberOfClicks = ko.observable(0);

            this.registerClick = function () {
                this.numberOfClicks(this.numberOfClicks() + 1);
            };

            this.resetClicks = function () {
                this.numberOfClicks(0);
            };

            this.goatCountMaster = ko.pureComputed(function () {
                return this.numberOfClicks() >= 101;
            }, this);
        };
        ko.applyBindings(ViewModel("GOAT","COUNTER"));  
    </script>  
</body>  
</html>  