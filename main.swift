//
//  main.swift
//  Adams-Bashforth
//
//  Created by Arkady Rubtsov on 12/03/2019.
//

import Foundation

// Adams-Bashforth four-step multistep method.
func ab4(a: Double, b: Double, n: Int) -> Void {
    var h, t, k1, k2, k3, k4: Double;
    var w = Array(repeating: 0.0, count: n + 1);
    
    h = (b - a) / Double(n);
    t = a;

    print("h = ", h, "\n");
    
    // First three steps are calculated with 4-step Runge Kutta method
    for i in 1...3 {
        k1 = f(t: t, y: w[i-1]);
        k2 = f(t: t + h/2, y: w[i-1] + k1/2);
        k3 = f(t: t + h/2, y: w[i-1] + k2/2);
        k4 = f(t: t + h, y: w[i-1] + k3);
        
        w[i] = w[i-1] + h/6*(k1 + 2.0 * k2 + 2.0 * k3 + k4);
        
        t += h;
        
        print("t =", t, "w =", w[i]);
    }
    
    for i in 4...n {
        k1 = 55 * f(t: t, y: w[i-1]) - 59 * f(t: t - h, y: w[i - 2]) + 37 * f(t: t - 2 * h, y: w[i - 3]) - 9 * f(t: t - 3 * h, y: w[i-4]);
        w[i] = w[i-1] + h/24 * k1;
        
        t = a + Double(i) * h;
        
        print("t =", t, "w =", w[i]);
    }
}

func f(t: Double, y: Double) -> Double{
    return 2*t;
}

ab4(a: 0, b: 5, n: 10);
