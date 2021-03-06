// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require moment
//= require pikaday
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .


Node.prototype.remove = function(){
  var parent = this.parentNode;
  if(parent){
    parent.removeChild(this);
  }
}

Node.prototype.insertAfter = function(nouvelElement, refElement){
  var that = this.nextSibling;
  if(that){
    that.insertBefore(nouvelElement, refElement);
  } else {
    this.appendChild(nouvelElement);
  }
}

function createElement(str){
  var frag = document.createElement("fragment");
  frag.innerHTML = str;
  return frag.firstChild;
}


ArtTagManage = {
  form: {},
  tagContent:[],

  initEventDetete:function(tag){
    var deleteEl = tag.getElementsByClassName("art_tag_delete")[0];
    var self = this;
    deleteEl.addEventListener("click", function(){
      tag.remove();
      self.updateTagContent();
      self.defineFocus();
    }, false)
  },

  updateTagContent:function(){
    this.tagContent = [];
    for(i=0; i<this.tags.length; i++){
      this.tagContent.push(this.tags[i].getAttribute("data-name"));
    }
    this.hiddenField.value = this.tagContent.join(", ");
  },

  formSubmitClick: function(){
    var tagContent = this.form.text.value, test=true;
    if(tagContent){
      for(i=0; i<this.tags.length; i++){
        test = this.tags[i].getAttribute("data-name") === tagContent ? false : true;
      }
      if(test){
        this.addTag(tagContent);
      }
    }
  },

  initEvents:function(){
    var self = this;
    for(i=0; i<this.tags.length; i++){
      this.initEventDetete(this.tags[i]);
    }
    this.form.submit.addEventListener("click", function(){
      self.formSubmitClick();
    }, false)

    this.form.text.addEventListener("focus", function(){
      window.addEventListener("keypress", self.listenerKeyPress, false)
    }, false)
    this.form.text.addEventListener("focusout", function(){
      window.removeEventListener("keypress", self.listenerKeyPress)
    }, false)
  },

  listenerKeyPress:function(e){
    if(e.keyCode === 13){
      ArtTagManage.formSubmitClick();
      return false;
    }
    return true;
  },

  blockSubmit:function(e){
    e.preventDefault();
    return false;
  },

  defineFocus:function(){
    this.form.text.value = "";
    this.form.text.focus();
  },

  addTag:function(content){
    var container = document.createElement("fragment");
    var prototype = this.tagManageContainer.getAttribute("data-prototype");
    prototype = prototype.replace(/__name__/g, content);
    container.innerHTML = prototype;
    var el = container.firstChild;
    this.tagManageContainer.appendChild(el);
    this.initEventDetete(el);
    this.updateTagContent();
    this.defineFocus();
  },

  init:function(){
    this.tagManage = document.getElementById("art_tag_manage");
    if(this.tagManage){
      this.tagManageContainer = this.tagManage.getElementsByClassName("art_tags_container")[0];
      this.tags = this.tagManage.getElementsByClassName("art_tag");
      this.form.text = document.getElementById("add_tag_text");
      this.form.submit = document.getElementById("add_tag_submit");
      this.hiddenField = document.getElementById("tag-field");
      this.formParent = document.getElementById("edit_user_1");
      this.updateTagContent();
      this.initEvents();
    }
  }
}

ImageFormManage = {
  initDeleteClick:function(el){
    console.log(el);
    var deleteEl = el.getElementsByClassName("delete")[0];
    deleteEl.addEventListener("click", function(){
      el.remove();
    }, false)
  },
  add:function(){
    this.idNew++
    var prototype = this.container.getAttribute("data-prototype");
    var el = createElement(prototype.replace(/__id__/g, this.idNew));
    this.container.appendChild(el);
    this.initDeleteClick(el);
  },
  initEvents:function(){
    var self = this;
    this.addButton.addEventListener("click", function(){
      self.add();
    }, false)
  },
  init:function(){
    this.el = document.getElementById("img-form-manage");
    if(this.el){
      this.addButton = document.getElementById("add-img-button");
      this.imgEls = this.el.getElementsByClassName("img-form");
      this.imgForms = this.el.getElementsByClassName("add-img-form");
      this.container = this.el.getElementsByClassName("img-forms")[0];
      this.idNew = parseInt(this.el.getAttribute("data-id"), 10);
      this.initDeleteClick(this.imgForms[this.imgForms.length-1]);
      this.initEvents();
    }
  }
}

HPphotoClick = {
  initClick:function(el){
    var self = this;
    el.addEventListener("click", function(){
      var url = this.getAttribute("data-url");
      for(i=0; i<self.els.length ; i++){
        self.els[i].className = self.els[i].className.replace("active", "");
      }
      this.className = this.className+=" active"
      if(url){
        self.photo.setAttribute("style", "background-image:url(\""+url+"\")");
        self.link.href = this.getAttribute("data-link");
      }
    }, false)
  },
  initEvents:function(){
    for(i=0; i<this.els.length; i++){
      this.initClick(this.els[i])
    }
  },
  init:function(){
    this.el = document.getElementById("lastExhib");
    if(this.el){
      this.els = this.el.getElementsByClassName("update-bg");
      this.photo = document.getElementById("photo-updated");
      this.link = document.getElementById("link-place");
      this.initEvents();
    }
  }
}


ImagePopin = {

  display:function(el){
    var self = this;
    this.img.src = el.src.replace("medium", "original");
    this.img.alt = el.alt;
    setTimeout(function(){
      self.popin.className = "visible"
    }, 500)
  },

  hide:function(el){
    var self = this;
    this.popin.className = "hidden"
  },

  initClick:function(el){
    var self = this;
    el.addEventListener("click", function(){
      self.display(this);
    }, false)
  },

  initEvents:function(){
    var self = this;
    for(i=0; i<this.els.length; i++){
      this.initClick(this.els[i]);
    }
    this.popin.addEventListener("click", function(){
      self.hide();
    }, false)
  },

  init:function(duration){
    this.els = document.getElementsByClassName("img-popin");
    if(this.els.length){
      this.popin = createElement("<div id=\"popin-image\" class=\"hidden\"><img src=\"\" alt=\"\"></div>");
      document.body.appendChild(this.popin);
      this.img = this.popin.getElementsByTagName("img")[0];
      this.duration = duration;
      this.initEvents();
    }
  }
}


PrettyForm = {
  input:[],
  textarea:[],
  setActive: function(status, el){
    if(status === true && !el.className.match("active")){
      el.className += " active"
    } else if(status === false) {
      el.className = el.className.replace("active", "")
    }
  },
  getFgroupsContent:function(){
    var type, el;
    for(i=0; i< this.fGroups.length; i++){
      type = this.fGroups[i].getAttribute("data-type") ? this.fGroups[i].getAttribute("data-type") : "input"
      el = this.fGroups[i].getElementsByTagName(type)[0];
      if(el){
        this[type].push({
            parent: this.fGroups[i],
            el : el
        })
      }
    }
  },
  manage:function(){
    for(i=0; i<this.input.length; i++){
      if(this.input[i].el.value){
        this.setActive(true, this.input[i].parent);
      } else {
        this.setActive(false, this.input[i].parent);
      }
    }
    for(i=0; i<this.textarea.length; i++){
      if(this.textarea[i].el.value){
        this.setActive(true, this.textarea[i].parent);
      } else {
        this.setActive(false, this.textarea[i].parent);
      }
      this.autosize(this.textarea[i].el);
    }
  },
  focusOut:function(group){
    var self = this;
    group.el.addEventListener("focusout", function(){
      if(!group.el.value){
        self.setActive(false, group.parent)
      }
    }, false)
  },
  changeListener:function(group){
    var self = this;
    group.el.addEventListener("change", function(){
      if(group.el.value){
        self.setActive(true, group.parent)
      }
    }, false)
  },
  initEvents:function(){
    var self = this;
    window.addEventListener("keypress", function(){
      self.manage();
    }, false)
    for(i=0; i<this.input.length; i++){
      this.focusOut(this.input[i]);
      this.changeListener(this.input[i])
    }
    for(i=0; i<this.textarea.length; i++){
      this.autosize(this.textarea[i].el)
      this.focusOut(this.textarea[i]);
    }

  },
  autosize:function(el){
    setTimeout(function(){
      el.style.cssText = 'height:auto; padding:0';
      el.style.cssText = 'height:' + el.scrollHeight + 'px';
    }, 1)
  },
  init:function(){
    this.fGroups = document.getElementsByClassName("pretty-form-group");
    if(this.fGroups.length){
      this.getFgroupsContent();
      setTimeout(function(){
          PrettyForm.manage();
      }, 50)
      this.initEvents();
    }
  }
}


function initDatePicker(){
  var dateField = document.getElementsByClassName("datepicker");
  var picker = []
  for(i=0; i<dateField.length; i++){
    picker.push(new Pikaday({
      field: dateField[i],
      format: 'YYYY-MM-DD'
    }));
  }
}

document.addEventListener("turbolinks:load", function() {
  ArtTagManage.init();
  HPphotoClick.init();
  ImagePopin.init(1000);
  PrettyForm.init();
  ScrollEffect.init();
  AwesomeParalax.init();
  initDatePicker();
  $( function() {
    $( "#tabs-profile" ).tabs();
  });
})
