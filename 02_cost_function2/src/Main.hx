package;

import python.Lib;

/**
 * ...
 * @author Urs Stutz
 */
class Main {
	
	static function main() {
		new Main();
	}
	
	public function new() {
		
		var dataset = create_dataset_2();
		
		var theta_0 = 0;
		var theta_1 = 1;
		
		var j_theta_0_1 = Cost_function.calculate( dataset, theta_0, theta_1 );
		
		trace( j_theta_0_1 );
		
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