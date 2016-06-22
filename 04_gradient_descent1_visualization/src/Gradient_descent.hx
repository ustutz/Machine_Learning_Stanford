package;

/**
 * ...
 * @author Urs Stutz
 */
class Gradient_descent {
	
	var dataset:Array<Data>;
	var precision:Float;
	var max_steps:Int;
	var alpha:Float;
	var theta_1:Float;
	var theta_0:Float;

	public var stepValues:Array<Float>;
	public var stepThetas:Array<Theta>;
	
	public function new( dataset:Array<Data>, theta_0:Float, theta_1:Float, alpha:Float, max_steps:Int, precision:Float ) {
		
		this.dataset = dataset;
		this.theta_0 = theta_0;
		this.theta_1 = theta_1;
		this.alpha = alpha;
		this.max_steps = max_steps;
		this.precision = precision;
	}
	
	public function calculate():Void {
		
		stepValues = new Array<Float>();
		stepThetas = new Array<Theta>();
		
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
			stepThetas.push( new Theta( theta_0, theta_1 ));
			
		}
		
		trace( "j_theta_0_1 " + j_theta_0_1 );
		
	}
	
	function derivative_0( dataset:Array<Data>, theta_0:Float, theta_1:Float, alpha:Float ):Float {
		return alpha * ( 1 / dataset.length ) * sum_theta_0( dataset, theta_0, theta_1 );
	}
	
	function derivative_1( dataset:Array<Data>, theta_0:Float, theta_1:Float, alpha:Float ):Float {
		return  alpha * ( 1 / dataset.length ) * sum_theta_1( dataset, theta_0, theta_1 );
	}
	
	function sum_theta_0( dataset:Array<Data>, theta_0:Float, theta_1:Float ):Float {
		
		var sum = 0.0;
		for ( data in dataset ) {
			
			var x = data.x;
			var y = data.y;
			
			sum += ( theta_0 + x * theta_1 ) - y;
		}
		return sum;
	}
	
	function sum_theta_1( dataset:Array<Data>, theta_0:Float, theta_1:Float ):Float {
		
		var sum = 0.0;
		for ( data in dataset ) {
			
			var x = data.x;
			var y = data.y;
			
			sum += (( theta_0 + x * theta_1 ) - y ) * x;
		}
		return sum;
	}
}