package;

import python.Lib;
import numpy.Numpy;
import python.Syntax;
/**
 * ...
 * @author Urs Stutz
 */
class Main {
	
	static function main() {
		
		var theta = Numpy.asmatrix( "1; 2; 3" );
		var x = Numpy.asmatrix( "4; 5; 6" );
		
		//trace( theta );
		//trace( x );
		
		// htheta(x) = sumj0n thetaj * xj
		
		// solution with loop
		var n = untyped len( theta );
		var m1 = 0;
		for ( j in 0...n ) {
			m1 += untyped theta[j] * x[j];
		}
		
		trace( m1 );
		
		// vectorized solution
		var m2 = untyped theta.transpose() * x;
		
		trace( m2 );
	}
	
}