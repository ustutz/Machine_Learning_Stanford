package;
using PyHelpers;

import python.Lib;
import matplotlib.pyplot.Pyplot;
import seaborn.Seaborn;

/**
 * ...
 * @author Urs Stutz
 */
class Main {
	
	static function main() {
		new Main();
	}
	
	public function new() {
		
		Seaborn.set_style( "darkgrid" );
		
		var dataset = create_dataset_2();
		
		var theta_0 = 0.0;
		var theta_1 = 0.0;
		var alpha = 0.000003; // learn factor
		var maxSteps = 200;
		var precision = 0.001;

		trace( "theta_0 " + theta_0 + "  theta_1 " + theta_1 );
		
		var gradientDescent = new Gradient_descent( dataset, theta_0, theta_1, alpha, maxSteps, precision );
		gradientDescent.calculate();
		
		var datasetX = new Array<Float>();
		var datasetY = new Array<Float>();
		
		var xMin = Math.POSITIVE_INFINITY;
		var yMin = Math.POSITIVE_INFINITY;
		
		var xMax = Math.NEGATIVE_INFINITY;
		var yMax = Math.NEGATIVE_INFINITY;
		
		for ( data in dataset ) {
			
			datasetX.push( data.x );
			datasetY.push( data.y );
			
			xMin = Math.min( xMin, data.x );
			yMin = Math.min( yMin, data.y );
			
			xMax = Math.max( xMax, data.x );
			yMax = Math.max( yMax, data.y );
		}
		
		//trace( "xMin, yMin, xMax, yMax " + xMin, yMin, xMax, yMax );
		
		var final_theta = gradientDescent.stepThetas[gradientDescent.stepThetas.length - 1];
		var lineY1 = getLineY( final_theta.theta_0, final_theta.theta_1, xMin );
		var lineY2 = getLineY( final_theta.theta_0, final_theta.theta_1, xMax );
		
		var lineX = [ xMin, xMax ];
		var lineY = [ lineY1, lineY2 ];
		
		//trace( "xMin, lineY1, xMax, lineY2 " + xMin, lineY1, xMax, lineY2 );
		
		Pyplot.figure(1);
		Pyplot.subplot.call(211);
		Pyplot.plot.call( datasetX, datasetY, "r." ); 
		Pyplot.plot.call( lineX, lineY ); 
		Pyplot.ylabel('price in 1000s');
		Pyplot.xlabel('size (qm)');
		
		Pyplot.subplot.call(212);
		Pyplot.plot.call( gradientDescent.stepValues ); 
		Pyplot.ylabel('theta_0_1');
		Pyplot.xlabel('steps');
		
		Pyplot.show();
	}

	function getLineY( theta_0:Float, theta_1:Float , x:Float ):Float {
		return theta_0 + x * theta_1;
	}
	
	function create_dataset_1():Array<Data> {
		
		var dataset = new Array<Data>();
		dataset.push( new Data( 1, 1 ));
		dataset.push( new Data( 2, 2 ));
		dataset.push( new Data( 3, 3 ));
		
		return dataset;
	}
	
	function create_dataset_2():Array<Data> {
		
		var dataset = new Array<Data>();
		dataset.push( new Data( 90, 190 ));
		dataset.push( new Data( 100, 180 ));
		dataset.push( new Data( 105, 250 ));
		dataset.push( new Data( 106, 300 ));
		dataset.push( new Data( 106, 245 ));
		dataset.push( new Data( 110, 200 ));
		dataset.push( new Data( 110, 230 ));
		dataset.push( new Data( 110, 260 ));
		dataset.push( new Data( 115, 300 ));
		dataset.push( new Data( 120, 210 ));
		dataset.push( new Data( 125, 210 ));
		dataset.push( new Data( 125, 200 ));
		dataset.push( new Data( 125, 250 ));
		dataset.push( new Data( 130, 200 ));
		dataset.push( new Data( 132, 240 ));
		dataset.push( new Data( 145, 250 ));
		dataset.push( new Data( 145, 250 ));
		dataset.push( new Data( 150, 360 ));
		dataset.push( new Data( 168, 230 ));
		dataset.push( new Data( 188, 230 ));
		dataset.push( new Data( 195, 260 ));
		dataset.push( new Data( 200, 280 ));
		dataset.push( new Data( 200, 360 ));
		dataset.push( new Data( 201, 300 ));
		dataset.push( new Data( 206, 400 ));
		dataset.push( new Data( 206, 400 ));
		dataset.push( new Data( 208, 350 ));
		dataset.push( new Data( 210, 390 ));
		dataset.push( new Data( 220, 460 ));
		dataset.push( new Data( 220, 460 ));
		dataset.push( new Data( 230, 330 ));
		dataset.push( new Data( 235, 450 ));
		dataset.push( new Data( 240, 380 ));
		dataset.push( new Data( 255, 455 ));
		dataset.push( new Data( 260, 310 ));
		dataset.push( new Data( 270, 500 ));
		dataset.push( new Data( 275, 300 ));
		
		return dataset;
	}
	
	
}