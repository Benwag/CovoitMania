package com.cfranc.UserManger.model;
import java.math.*;

public class CalculDistance {
	private static final double RADIUS=6371; 
	
	static double calculDistanceEntreDeuxCoordonnees(double latA,double longA, double latB, double longB){
		double resultat=RADIUS*Math.acos(Math.sin(latA*2*Math.PI/360)*Math.sin(latB*2*Math.PI/360)+Math.cos(latA*2*Math.PI/360)*Math.cos(latB*2*Math.PI/360)*Math.cos(longA*2*Math.PI/360-longB*2*Math.PI/360));
		return resultat;
	}

}
