var tsmodel = (function(){
  var modelContainer = document.querySelector("#container");
  var model = new TSP.models.Sequential( modelContainer, { animationTimeRatio: 0.2,	color: { background: 0xf1f1f1 }});
  var colorInpu = colorOutp = 0x000000;
  var colorConv = 0x000e36;
  var colorPool = 0x028900;
  var colorDens = 0xeeba30;
  model.add(new TSP.layers.GreyscaleInput({ shape: [28, 28, 1], color: colorInpu }));
  model.add(new TSP.layers.Conv2d({ kernelSize: 3, filters: 8, strides: 1, color: colorConv }));
  model.add(new TSP.layers.Pooling2d({ poolSize: [2, 2], strides: [2, 2], padding: 'same', color: colorPool }));
  model.add(new TSP.layers.Conv2d({ kernelSize: 3, filters: 16, strides: 1, color: colorConv }));
  model.add(new TSP.layers.Pooling2d({ poolSize: [2, 2], strides: [2, 2], padding: 'same', color: colorPool }));
  model.add(new TSP.layers.Conv2d({ kernelSize: 3, filters: 32, strides: 1, color: colorConv }));
  model.add(new TSP.layers.Pooling2d({ poolSize: [2, 2], strides: [2, 2], padding: 'same', color: colorPool }));
  model.add(new TSP.layers.Dense({ units: 100, color: colorDens }));
  model.add(new TSP.layers.Dense({ units: 10, color: colorDens }));
  model.add(new TSP.layers.Output1d({ units: 10, outputs: ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"], color : colorOutp }) );
  model.load({
    type: "tensorflow",
    modelUrl: "./model/tensorflowjs_model.pb",
    weightUrl: "./model/weights_manifest.json",
    outputsName: ["l1/Relu","l1max","l2/Relu","l2max","l3/Relu","l3max","l4/Relu","l5/BiasAdd","output"],
    onComplete: function() {
      console.log("Loaded");
    }
  });
  model.init();
  var predict = function(data){
    model.predict( data , function (res){
      var maxInd = 0;
      for(var i = 1; i < res.length; i ++ ) {
		    maxInd = res[i]>res[maxInd]?i:maxInd;
      }
      res = 'Prediction&nbsp;:&nbsp;<b>'+maxInd+'</b>';
      M.toast({html: res, displayLength: 8000});
    });
  };

  return {
    predict: predict
  };
})();