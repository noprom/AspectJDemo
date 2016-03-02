package com.aspectj.demo.aspect;

public aspect CFowAspect {

	pointcut barPoint() : execution(* bar(..));

	pointcut fooPoint() : execution(* foo(..));

	/**
	 * cflow的参数是一个pointcut
	 */
	pointcut barCfow() : cflow(barPoint()) && !within(CFowAspect);

	/**
	 * 获取bar流程内的foo方法调用
	 */
	pointcut fooInBar() : barCfow() && fooPoint();

	before() : barCfow(){
		System.out.println("Enter:" + thisJoinPoint);
	}
}
