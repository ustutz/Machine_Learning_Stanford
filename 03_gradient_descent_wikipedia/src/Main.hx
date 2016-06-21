package;

import python.Lib;

/**
 * ...
 * The gradient descent algorithm is applied to find a local minimum of the function 
 * f(x)= x^4 − 3x^3 + 2, with derivative f'(x)= 4x^3 − 9x^2.
 * 
 */
class Main {
	
	static function main() {
		new Main();
	}
	
	public function new() {
		
		// From calculation, we expect that the local minimum occurs at x=9/4

		var x_old = 0.0; // The value does not matter as long as abs(x_new - x_old) > precision
		var x_new = 6.0; // The algorithm starts at x=6
		var gamma = 0.01; // step size
		var precision = 0.00001;


		while( Math.abs(x_new - x_old) > precision ) {
			
			x_old = x_new;
			x_new = x_old - gamma * f_derivative( x_old );
			
			trace( "x_new " + x_new );
		}
		
		trace("Local minimum occurs at " + x_new);
		
	}
	
	function f_derivative( x:Float ):Float {
		
		return 4 * Math.pow( x, 3 ) - 9 * Math.pow( x, 2 );
	}
}