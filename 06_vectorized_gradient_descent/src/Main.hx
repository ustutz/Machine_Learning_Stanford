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
		
		var data = Numpy.genfromtxt.call( "ex1data1.txt", delimiter => ',' );
		
		var X = Numpy.asmatrix( Syntax.pythonCode( "data[:,0]" )).transpose();
		var y = Numpy.asmatrix( Syntax.pythonCode( "data[:,1]" )).transpose();
		var m = untyped len( y ); // number of trainig examples
		
		//plotData( X, y );
		Pyplot.plot.call( X, y, 'r.' );
		Pyplot.ylabel( 'Profit in $10,000s' );
		Pyplot.xlabel( 'Population of City in 10,000s' );
		
		trace( 'Running Gradient Descent ...' );
		
		var ones = Numpy.ones( Syntax.pythonCode( '( m, 1 )'));
		
		X = Numpy.concatenate.call( Syntax.pythonCode( '(ones, X)' ), axis => 1 );
		
		var theta = Numpy.zeros( Syntax.pythonCode( '( 2, 1 )' )); //initialize fitting parameters
		
		// Some gradient descent settings
		var iterations = 1500;
		var alpha = 0.01;
		
		// compute and display initial cost
		var Jtheta = computeCost( X, y, theta, m );
		
		// run gradient descent
		theta = gradientDescent( X, y, theta, alpha, iterations, m );
		
		// print theta to screen
		trace( 'Theta found by gradient descent: ' );
		trace( theta );
		
		// Plot the linear fit
		var secondColumn = Syntax.pythonCode( 'X[:, 1]' );
		Pyplot.plot.call( secondColumn, untyped X * theta, '-' );
		
		// Predict values for population sizes of 35,000 and 70,000
		var thetaPredict1 = Numpy.asmatrix( '1, 3.5' );
		var predict1 = untyped thetaPredict1 * theta * 10000;
		trace( 'For population = 35,000, we predict a profit of' );
		trace( predict1 );
		
		var thetaPredict2 = Numpy.asmatrix( '1, 7' );
		var predict2 = untyped thetaPredict2 * theta * 10000;
		trace( 'For population = 70,000, we predict a profit of' );
		trace( predict2 );
		
		Pyplot.show();
	}
	
	function plotData( x, y ):Void {
		
	}
	
	function computeCost( X, y, theta, m:Int ):Float {
		return 1 / ( 2 * m ) * untyped Numpy.sum( Numpy.power(( X * theta ) - y, 2 ));
	}
	
	function gradientDescent( X:Dynamic, y, theta, alpha:Float, iterations:Int, m:Int ):Dynamic {
		
		//var J_history = Numpy.zeros( Syntax.pythonCode( '(iterations, 1)' );
		
		for ( iter in 0...iterations ) {
			var delta = 1 / m * untyped( X.transpose() * ( X * theta -y ));
			var temp = untyped theta - alpha * delta;
			theta = temp;
		}
		return theta;
	}
}