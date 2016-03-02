package com.aspectj.demo.test;

import org.junit.Test;

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
