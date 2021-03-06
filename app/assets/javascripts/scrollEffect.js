// Renvoi la position d'un élément
function getElementPosition(e, isCenter) {
    var left = 0;
    var top = 0;

    if (isCenter == true) {
        console.log("center")
        left = e.offsetWidth / 2;
        top = e.offsetWidth / 2;
    }

    /*Tant que l'on a un élément parent*/
    while (e.offsetParent != undefined && e.offsetParent != null) {
        /*On ajoute la position de l'élément parent*/
        left += e.offsetLeft + (e.clientLeft != null ? e.clientLeft : 0);
        top += e.offsetTop + (e.clientTop != null ? e.clientTop : 0);
        e = e.offsetParent;
    }

    return {
        x: left,
        y: top
    };
};

//Prototype retournant la position d'un élément par rapport au haut de la page
Node.prototype.getPosition = function(isCenter){
  var left = 0;
  var top = 0;
  var e = this;

  if (isCenter == true) {
      console.log("center")
      left = e.offsetWidth / 2;
      top = e.offsetWidth / 2;
  }

  /*Tant que l'on a un élément parent*/
  while (e.offsetParent != undefined && e.offsetParent != null) {
      /*On ajoute la position de l'élément parent*/
      left += e.offsetLeft + (e.clientLeft != null ? e.clientLeft : 0);
      top += e.offsetTop + (e.clientTop != null ? e.clientTop : 0);
      e = e.offsetParent;
  }

  return {
      x: left,
      y: top
  };
}

window.mobilecheck = function() {
    var check = false;
    (function(a) {
        if (/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a) || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0, 4))) check = true;
    })(navigator.userAgent || navigator.vendor || window.opera);
    return check;
};


Object.defineProperties(window, {
  scrollTop: {
    get: function() {
      return (document.documentElement && document.documentElement.scrollTop) || document.body.scrollTop;
    },
    set: function(value) {
      var scrollTop = ((document.documentElement && document.documentElement.scrollTop) || document.body.scrollTop);
      scrollTop = value;
      window.scrollTo(0, scrollTop)
    }
  }
});


ScrollEffect = {
    ratio: 0.75,
    elementsPosition: [],
    saveElementsPosition: function() {
      var that = ScrollEffect;
      for (i = 0; i < that.elements.length; i++) {
        that.elementsPosition[i] =  that.elements[i].getPosition();
      }
    },
    setAnimationState: function(rank, value) {
        var el = this.elements[rank];
        var animationState = el.getAttribute("data-anim-status");
        // Si son état est en attente
        if (animationState == "off") {
            // Si le delay est spécifié
            if (el.getAttribute("data-delay")) {
                var animationDelay = el.getAttribute("data-delay");
                animationDelay = parseFloat(animationDelay);
                setTimeout(function() {
                    el.setAttribute("data-anim-status", "on");
                }, animationDelay)
            } else {
                el.setAttribute("data-anim-status", "on");
            }
        } else if(animationState == "on" && value=="off" && el.getAttribute("data-reload")){
          el.setAttribute("data-anim-status", "off");
        }
    },
    manageScrollEffect: function() {
      for (i = 0; i < this.elementsPosition.length; i++) {
        if (this.elementsPosition[i].y < this.horizon) {
          this.setAnimationState(i, "on");
        } else if(this.elementsPosition[i].y > this.horizon && this.elements[i].getAttribute("data-anim-status")=="on"){
          this.setAnimationState(i, "off");
        }
      }
    },
    updateEffectLine:function(){
      this.horizon = window.scrollTop + window.innerHeight*this.ratio;
      return this.horizon;
    },
    scrollEvents: function() {
      var self = this;
      this.updateEffectLine();
      if (window.mobilecheck() === false) {
        window.addEventListener("scroll", function() {
          self.updateEffectLine();
          self.manageScrollEffect();
        }, false);
      } else {
        for (i = 0; i < this.elementsPosition.length; i++) {
          this.setAnimationState(i);
        }
      }
    },
    resizeEvent:function(){

    },
    init: function() {
        this.elements = document.querySelectorAll("*[data-anim-status]");
        if (this.elements) {
            this.saveElementsPosition();
            this.scrollEvents();
            window.addEventListener("resize", this.saveElementsPosition, false);
        }
    },
}
