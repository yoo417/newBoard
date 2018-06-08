function Router(x){
	//옛날 자바스크립트 문법
	sessionStorage.setItem('context',x);
	sessionStorage.setItem('javascript',x+'/resources/js');
	sessionStorage.setItem('style',x+'/resources/css');
	sessionStorage.setItem('image',x+'/resources/img');
	return {
		context: ()=>{return sessionStorage.getItem('context');},
		javascript: ()=>{return sessionStorage.getItem('javascript');},
		style:()=>{return sessionStorage.getItem('style');},
		image:()=>{return sessionStorage.getItem('image');}
	}
	
}
function Cart(x){
	sessionStorage.setItem('cart',x);
	
	return {
		get: ()=>{return sessionStorage.getItem('cart');}
	}
}
function Customer(x){
	sessionStorage.setItem('customer', x);
	
	return{
		get: ()=>{return sessionStorage.getItem('customer');}
	}
}