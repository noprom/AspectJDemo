package com.aspectj.demo.aspect;

public aspect HelloAspect {

	/**
	 * 传入参数执行
	 * 
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

	/**
	 * 排除某些特定的类 这里使用within排除了HelloAspectDemo中的main方法
	 */
	pointcut ExceptSomeFunc(): execution(* main(..)) && !within(HelloAspectDemo);

	before(): ExceptSomeFunc() {
		System.out.println("Entering : " + thisJoinPoint.getSourceLocation());
	}

	/**
	 * 测试around通知
	 * 
	 * @param x
	 */
	pointcut TestAround(int x): execution(* main(int)) && !within(HelloAspectDemo) && args(x);

	int around(int x) : TestAround(x){
		System.out.println("Entering : " + thisJoinPoint.getSourceLocation());
		int newValue = proceed(x * 3);
		return newValue;
	}
}
