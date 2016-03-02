package com.aspectj.demo.test;

import org.junit.Test;

/**
 * 测试代码调用流程
 * 
 * @author noprom
 *
 */
public class TestCFlow {

	public void foo() {
		System.out.println("foo......");
	}

	public void bar() {
		foo();
		System.out.println("bar.........");
	}

	@Test
	public void testMethod() {
		bar();
		foo();
	}
}
