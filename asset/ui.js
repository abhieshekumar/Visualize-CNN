var ui = function(){
  
	var canvas = document.querySelector('#user');
  var ctx = canvas.getContext('2d');
  var width = 280;
  var height = 280;
  var swidth = width/10;
  var sheight = height/10;
	var mouse = {x: 0, y: 0};
  var last_mouse = {x: 0, y: 0};
  ctx.lineWidth = 20;
  ctx.lineJoin = 'round';
  ctx.lineCap = 'square';
  ctx.strokeStyle = 'black';

  ['touchmove','mousemove'].forEach(function(event){
      canvas.addEventListener(event, function(e) {
        last_mouse.x = mouse.x;
        last_mouse.y = mouse.y;
        mouse.x = ((event=='touchmove')?e.touches[0].pageX:e.pageX) - this.offsetLeft;
        mouse.y = ((event=='touchmove')?e.touches[0].pageY:e.pageY) - this.offsetTop;
        if(event=='touchmove'){
          last_mouse = mouse;
        }
      }, false); 
  });	

  ['mousedown','touchstart'].forEach(function(event){
    canvas.addEventListener(event, function(e) {
      ['mousemove','touchmove'].forEach(function(ievent){
        canvas.addEventListener(ievent, onPaint, false);
      });
    }, false);
  });

  ['mouseup','touchend'].forEach(function(event){
    canvas.addEventListener(event, function(e) {
      ['mousemove','touchmove'].forEach(function(ievent){
        canvas.removeEventListener(ievent, onPaint, false);
      });
    }, false);
  });

	var onPaint = function() {
		ctx.beginPath();
		ctx.moveTo(last_mouse.x, last_mouse.y);
		ctx.lineTo(mouse.x, mouse.y);
		ctx.closePath();
		ctx.stroke();
  };

  var erase = function() {
    var context = document.querySelector('#clone').getContext('2d');    
    context.save();
    context.setTransform(1, 0, 0, 1, 0, 0);
    context.clearRect(0, 0, swidth, sheight);
    ctx.clearRect(0, 0, width, height);
    ctx.beginPath();
  };

  var predictImage = function() {
    var drawnImage = ctx.getImageData(0,0,width,height);
    var context = document.querySelector('#clone').getContext('2d');
    context.resetTransform();
    context.scale(0.1,0.1);
    context.drawImage(document.getElementById('user'),0,0);
    var da = context.getImageData(0,0,swidth,sheight);
    var arr=[];
    for(var i=3;i<swidth*sheight*4;i+=4)
      arr.push((da.data[i])/255);
    tsmodel.predict( arr );
  }

  var minimize = function(){
    document.querySelector('#user').style.display='none'; 
    document.querySelector('#controls').style.display='none';
    document.querySelector('#actionMaximize').style.display='block';   
  }

  var maximize = function(){
    document.querySelector('#user').style.display='inline-block';
    document.querySelector('#controls').style.display='block';
    document.querySelector('#actionMaximize').style.display='none';
  }

  return{
    erase: erase,
    predict: predictImage,
    minimize: minimize,
    maximize: maximize
  }
}();