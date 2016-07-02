package;
using PyHelpers;

import python.Lib;
import python.Syntax;
import sys.io.File;

import numpy.Numpy;
import matplotlib.pyplot.Pyplot;
import seaborn.Seaborn;

/**
 * ...
 * @author Urs Stutz
 */
class Main {
	
	static function main() {
		
		Seaborn.set_style( "darkgrid" );
		new Main();
	}
	
	public function new() {
		
		// load training data - predict a child's weight as a function of his age and height
		// data contains these columns
		// age, height in cm, weight in kg
		var data = Numpy.genfromtxt.call( "data1.txt", delimiter => ',' );

		var X = Numpy.asmatrix( Syntax.pythonCode( "data[:,0:2]" ));
		var y = Numpy.asmatrix( Syntax.pythonCode( "data[:,2]" )).transpose();
		var m = untyped len( y ); // number of training examples
		
		//trace( X );
		//trace( y );
		
		// predict function
		// weight = theta0 + theta1 * age + theta2 * height
		
		var ones = Numpy.ones( Syntax.pythonCode( '( m, 1 )'));
		X = Numpy.concatenate.call( Syntax.pythonCode( '(ones, X)' ), axis => 1 );
		var Xtransposed = X.transpose();
		var theta = untyped Numpy.linalg.pinv( Xtransposed * X ) * Xtransposed * y;
		
		trace( "minimal theta is " );
		trace( theta );
		
		var weight1 = untyped theta[0] + theta[1] * 4 + theta[2] * 89;
		
		trace( "weight of child1 of 4 years and height 89 cm" );
		trace( weight1 );
		
		var weight2 = untyped theta[0] + theta[1] * 6 + theta[2] * 120;
		
		trace( "weight of child1 of 6 years and height 120 cm" );
		trace( weight2 );
		
	}
	
}