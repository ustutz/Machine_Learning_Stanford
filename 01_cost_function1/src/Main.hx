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
		
		var dataset = create_dataset_1();
		var theta_1 = 1;
		
		var j_theta_1 = Cost_function.calculate( dataset, theta_1 );
		
		trace( j_theta_1 );
		
	}

	function create_dataset_1():Array<Data> {
		
		var dataset = new Array<Data>();
		dataset.push( new Data( 1, 1 ));
		dataset.push( new Data( 2, 2 ));
		dataset.push( new Data( 3, 3 ));
		
		return dataset;
	}
	
	
}