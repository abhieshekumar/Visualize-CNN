
,
ConstConst*
dtype0*
valueB 
G
inputPlaceholder*
dtype0*$
shape:���������
@
	l1/kernelConst*
valueB*
dtype0
2
l1/biasConst*
value
B*
dtype0
@
	l2/kernelConst*
valueB*
dtype0
2
l2/biasConst*
value
B*
dtype0
@
	l3/kernelConst*
dtype0*
valueB 
2
l3/biasConst*
dtype0*
value
B 
F
flatten/strided_slice/stackConst*
value
B*
dtype0
H
flatten/strided_slice/stack_1Const*
dtype0*
value
B
>
flatten/Reshape/shape/1Const*
dtype0*
valueB 
9
	l4/kernelConst*
dtype0*
valueB	�d
2
l4/biasConst*
dtype0*
value
Bd
8
	l5/kernelConst*
valueBd
*
dtype0
2
l5/biasConst*
value
B
*
dtype0
Q
PlaceholderWithDefaultPlaceholderWithDefaultConst*
dtype0*
shape: 
�
	l1/Conv2DConv2Dinput	l1/kernel*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
paddingVALID*
	dilations
*
T0
I

l1/BiasAddBiasAdd	l1/Conv2Dl1/bias*
T0*
data_formatNHWC
$
l1/ReluRelu
l1/BiasAdd*
T0
t
l1maxMaxPooll1/Relu*
data_formatNHWC*
strides
*
ksize
*
paddingSAME*
T0
>
dropout/divRealDivl1maxPlaceholderWithDefault*
T0
6
dropout/ShapeShapel1max*
T0*
out_type0
s
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape*
dtype0*
seed2 *

seed *
T0
Y
dropout/addAddPlaceholderWithDefault$dropout/random_uniform/RandomUniform*
T0
,
dropout/FloorFloordropout/add*
T0
7
dropout/mulMuldropout/divdropout/Floor*
T0
�
	l2/Conv2DConv2Ddropout/mul	l2/kernel*
paddingVALID*
	dilations
*
T0*
strides
*
data_formatNHWC*
use_cudnn_on_gpu(
I

l2/BiasAddBiasAdd	l2/Conv2Dl2/bias*
data_formatNHWC*
T0
$
l2/ReluRelu
l2/BiasAdd*
T0
t
l2maxMaxPooll2/Relu*
ksize
*
paddingSAME*
T0*
data_formatNHWC*
strides

@
dropout_1/divRealDivl2maxPlaceholderWithDefault*
T0
8
dropout_1/ShapeShapel2max*
T0*
out_type0
w
&dropout_1/random_uniform/RandomUniformRandomUniformdropout_1/Shape*
dtype0*
seed2 *

seed *
T0
]
dropout_1/addAddPlaceholderWithDefault&dropout_1/random_uniform/RandomUniform*
T0
0
dropout_1/FloorFloordropout_1/add*
T0
=
dropout_1/mulMuldropout_1/divdropout_1/Floor*
T0
�
	l3/Conv2DConv2Ddropout_1/mul	l3/kernel*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
paddingVALID*
	dilations
*
T0
I

l3/BiasAddBiasAdd	l3/Conv2Dl3/bias*
data_formatNHWC*
T0
$
l3/ReluRelu
l3/BiasAdd*
T0
t
l3maxMaxPooll3/Relu*
ksize
*
paddingSAME*
T0*
data_formatNHWC*
strides

@
dropout_2/divRealDivl3maxPlaceholderWithDefault*
T0
8
dropout_2/ShapeShapel3max*
T0*
out_type0
w
&dropout_2/random_uniform/RandomUniformRandomUniformdropout_2/Shape*
dtype0*
seed2 *

seed *
T0
]
dropout_2/addAddPlaceholderWithDefault&dropout_2/random_uniform/RandomUniform*
T0
0
dropout_2/FloorFloordropout_2/add*
T0
=
dropout_2/mulMuldropout_2/divdropout_2/Floor*
T0
>
flatten/ShapeShapedropout_2/mul*
T0*
out_type0
�
flatten/strided_sliceStridedSliceflatten/Shapeflatten/strided_slice/stackflatten/strided_slice/stack_1flatten/strided_slice/stack_1*
Index0*
T0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask 
k
flatten/Reshape/shapePackflatten/strided_sliceflatten/Reshape/shape/1*
T0*

axis *
N
W
flatten/ReshapeReshapedropout_2/mulflatten/Reshape/shape*
T0*
Tshape0
^
	l4/MatMulMatMulflatten/Reshape	l4/kernel*
transpose_a( *
transpose_b( *
T0
I

l4/BiasAddBiasAdd	l4/MatMull4/bias*
data_formatNHWC*
T0
$
l4/ReluRelu
l4/BiasAdd*
T0
B
dropout_3/divRealDivl4/ReluPlaceholderWithDefault*
T0
:
dropout_3/ShapeShapel4/Relu*
T0*
out_type0
w
&dropout_3/random_uniform/RandomUniformRandomUniformdropout_3/Shape*
T0*
dtype0*
seed2 *

seed 
]
dropout_3/addAddPlaceholderWithDefault&dropout_3/random_uniform/RandomUniform*
T0
0
dropout_3/FloorFloordropout_3/add*
T0
=
dropout_3/mulMuldropout_3/divdropout_3/Floor*
T0
\
	l5/MatMulMatMuldropout_3/mul	l5/kernel*
T0*
transpose_a( *
transpose_b( 
I

l5/BiasAddBiasAdd	l5/MatMull5/bias*
data_formatNHWC*
T0
&
outputSoftmax
l5/BiasAdd*
T0 " 