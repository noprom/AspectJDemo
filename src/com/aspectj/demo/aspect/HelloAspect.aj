package com.aspectj.demo.aspect;

public aspect HelloAspect {

	/**
	 * 传入参数执行
	 * @param i
	 */
	pointcut HelloWorldPointCut(int i) : 
		execution(* com.aspectj.demo.test.HelloWorld.main(int)) && args(i);

	before(int x) : HelloWorldPointCut(x){
		x += 5;
		System.out.println("in the aspect i = " + x);
	}

	/**
	 * 测试call
	 */
	pointcut TestCall(): call(* main(int));

	before(): TestCall() {
		System.out.println("Entering : " + thisJoinPoint.getSourceLocation());
	}
	
	/**
	 * 测试execution
	 */
	pointcut TestExec(): execution(* main(int));
	
	before(): TestExec() {
		System.out.println("Entering : " + thisJoinPoint.getSourceLocation());
	}
}
