var app = app || {};
app = (()=>{
	var init = x =>{
	  $.getScript(x+'/resources/js/router.js',()=>{
	        $.extend(new Router(x));
	        app.navout.onCreate($.context());
	        app.main.onCreate($.context());
	        app.footer.onCreate($.context());
	  })
	};
	return {init:init};
})();
app.router = (()=>{
	  var onCreate=x=>{
	  $.getScript(x+'resources/js/router.js',()=>{ 
	      $.extend(new Router(x));
	      });        
	  };
	  return {onCreate:onCreate};
})();