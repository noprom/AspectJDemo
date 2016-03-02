package com.aspectj.demo.aspect;

public aspect HelloAspect {

	pointcut HelloWorldPointCut() : execution(* com.aspectj.demo.test.HelloWorld.main(..));

	before() : HelloWorldPointCut(){
		System.out.println("Hello world");
	}
}
