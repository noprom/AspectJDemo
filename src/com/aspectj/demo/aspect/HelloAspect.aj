package com.aspectj.demo.aspect;

public aspect HelloAspect {

	pointcut HelloWorldPointCut(int i) : 
		execution(* com.aspectj.demo.test.HelloWorld.main(int)) && args(i);

	before(int x) : HelloWorldPointCut(x){
		x += 5;
		System.out.println("in the aspect i = " + x);
	}
}
