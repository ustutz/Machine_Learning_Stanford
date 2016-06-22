package;

/**
 * ...
 * @author Urs Stutz
 */
class Gradient_descent {

	public static function calculate( dataset:Array<Data>, theta_0:Float, theta_1:Float, alpha:Float, max_steps:Int, precision:Float ):Array<Float> {
		
		var stepValues = new Array<Float>();
		
		var delta_j_theta_0_1 = Math.POSITIVE_INFINITY;
		var j_theta_0_1 = Cost_function.calculate( dataset, theta_0, theta_1 );
		
		var counter = 0;
		
		while( delta_j_theta_0_1 > precision && counter < max_steps ) {
			
			var temp_theta_0 = theta_0 - derivative_0( dataset, theta_0, theta_1, alpha );
			var temp_theta_1 = theta_1 - derivative_1( dataset, theta_0, theta_1, alpha );
			
			counter++;
			
			theta_0 = temp_theta_0;
			theta_1 = temp_theta_1;

			var temp_j_theta_0_1 = Cost_function.calculate( dataset, theta_0, theta_1 );
			delta_j_theta_0_1 = Math.abs( j_theta_0_1 - temp_j_theta_0_1 );
			
			j_theta_0_1 = temp_j_theta_0_1;
			
			trace( "delta_j_theta_0_1 " + delta_j_theta_0_1 );
			stepValues.push( -j_theta_0_1 );
			
		}
		
		trace( "j_theta_0_1 " + j_theta_0_1 );
		
		return stepValues;
	}
	
	static function derivative_0( dataset:Array<Data>, theta_0:Float, theta_1:Float, alpha:Float ):Float {
		return alpha * ( 1 / dataset.length ) * sum_theta_0( dataset, theta_0, theta_1 );
	}
	
	static function derivative_1( dataset:Array<Data>, theta_0:Float, theta_1:Float, alpha:Float ):Float {
		return  alpha * ( 1 / dataset.length ) * sum_theta_1( dataset, theta_0, theta_1 );
	}
	
	static function sum_theta_0( dataset:Array<Data>, theta_0:Float, theta_1:Float ):Float {
		
		var sum = 0.0;
		for ( data in dataset ) {
			
			var x = data.x;
			var y = data.y;
			
			sum += ( theta_0 + x * theta_1 ) - y;
		}
		return sum;
	}
	
	static function sum_theta_1( dataset:Array<Data>, theta_0:Float, theta_1:Float ):Float {
		
		var sum = 0.0;
		for ( data in dataset ) {
			
			var x = data.x;
			var y = data.y;
			
			sum += (( theta_0 + x * theta_1 ) - y ) * x;
		}
		return sum;
	}
}