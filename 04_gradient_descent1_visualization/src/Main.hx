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
		var alpha = 0.0000001; // learn factor
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
		
		trace( "xMin, yMin, xMax, yMax " + xMin, yMin, xMax, yMax );
		
		var lineY1 = gradientDescent.final_theta_0 + yMin * gradientDescent.final_theta_1;
		var lineY2 = gradientDescent.final_theta_0 + yMax * gradientDescent.final_theta_1;
		
		var lineX = [ xMin, xMax ];
		var lineY = [ lineY1, lineY2 ];
		
		trace( "xMin, lineY1, xMax, lineY2 " + xMin, lineY1, xMax, lineY2 );
		
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

	function create_dataset_1():Array<Data> {
		
		var dataset = new Array<Data>();
		dataset.push( new Data( 1, 1 ));
		dataset.push( new Data( 2, 2 ));
		dataset.push( new Data( 3, 3 ));
		
		return dataset;
	}
	
	function create_dataset_2():Array<Data> {
		
		var dataset = new Array<Data>();
		dataset.push( new Data( 900, 190 ));
		dataset.push( new Data( 1000, 180 ));
		dataset.push( new Data( 1050, 250 ));
		dataset.push( new Data( 1060, 300 ));
		dataset.push( new Data( 1060, 245 ));
		dataset.push( new Data( 1100, 200 ));
		dataset.push( new Data( 1100, 230 ));
		dataset.push( new Data( 1100, 260 ));
		dataset.push( new Data( 1150, 300 ));
		dataset.push( new Data( 1200, 210 ));
		dataset.push( new Data( 1250, 210 ));
		dataset.push( new Data( 1250, 200 ));
		dataset.push( new Data( 1250, 250 ));
		dataset.push( new Data( 1300, 200 ));
		dataset.push( new Data( 1320, 240 ));
		dataset.push( new Data( 1450, 250 ));
		dataset.push( new Data( 1450, 250 ));
		dataset.push( new Data( 1500, 460 ));
		dataset.push( new Data( 1680, 230 ));
		dataset.push( new Data( 1880, 230 ));
		dataset.push( new Data( 1950, 260 ));
		dataset.push( new Data( 2000, 280 ));
		dataset.push( new Data( 2000, 360 ));
		dataset.push( new Data( 2010, 300 ));
		dataset.push( new Data( 2060, 400 ));
		dataset.push( new Data( 2060, 400 ));
		dataset.push( new Data( 2080, 350 ));
		dataset.push( new Data( 2100, 390 ));
		dataset.push( new Data( 2200, 460 ));
		dataset.push( new Data( 2200, 460 ));
		dataset.push( new Data( 2300, 330 ));
		dataset.push( new Data( 2350, 450 ));
		dataset.push( new Data( 2400, 380 ));
		dataset.push( new Data( 2550, 455 ));
		dataset.push( new Data( 2600, 310 ));
		dataset.push( new Data( 2700, 500 ));
		dataset.push( new Data( 2750, 300 ));
		
		return dataset;
	}
	
	
}