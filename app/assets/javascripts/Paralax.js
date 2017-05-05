function setPrefix(key,value){
  var pre = ["moz", "ms", "o", "webkit"];
  var result = "";
  for(i=0; i<pre.length; i++){
    result+="-"+pre[i]+"-"+key+":"+value+";";
  }
  return result;
}

AwesomeParalax = {
  intensity: 300,
  offset: 0,
  updatePositions:function(){
    var that = AwesomeParalax;
    for(i=0; i<that.els.length; i++){
      that.els[i].position = that.els[i].getPosition();
    }
  },
  calc:function(el){
    var ratio = (el.position.y+el.offsetHeight - this.top)/(window.innerHeight+el.offsetHeight);
    el.setAttribute("style", setPrefix("transform", "translateY("+ratio*this.intensity+"px) translateZ(0)"));
  },
  main:function(){
    var that = AwesomeParalax, el;
    that.bottom = window.scrollTop+window.innerHeight;
    that.top = window.scrollTop;
    for(i=0; i<that.els.length; i++){
      el = that.els[i];
      if((el.position.y > that.top || el.position.y+el.offsetHeight > that.top) && el.position.y < that.bottom) that.calc(el);
    }
  },
  init:function(args){
    this.els = document.querySelectorAll("*[data-paralax]");
    if(this.els){
      if(args){
        if(args.offset && !isNaN(args.offset)) this.offset = args.offset;
        if(args.intensity && !isNaN(args.intensity)) this.intensity = args.intensity;
      }
      this.horizon = window.scrollTop;
      this.updatePositions();
      this.main();
      window.addEventListener("resize", this.updatePositions, false);
      window.addEventListener("scroll", this.main, false);
    }
  }
}
