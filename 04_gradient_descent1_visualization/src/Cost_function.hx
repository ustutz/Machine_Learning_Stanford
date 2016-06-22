package;

/**
 * ...
 * @author Urs Stutz
 */
class Cost_function {

	public static function calculate( dataset:Array<Data>, theta_0:Float, theta_1:Float ):Float {
		
		var j_theta_0_1 = 1 / ( 2 * dataset.length ) * sum( dataset, theta_0, theta_1 );
		
		return j_theta_0_1;
	}
	
	static function sum( dataset:Array<Data>, theta_0:Float, theta_1:Float ):Float {
		
		var sum = 0.0;
		for ( data in dataset ) {
			
			var x = data.x;
			var y = data.y;
			
			sum += ( theta_0 + x * theta_1 ) - y;
		}
		return sum;
	}
	
	
}